#!/bin/sh

. "${HERE}/core/logging.sh"
. "${HERE}/core/os.sh"


op_command_setup_help(){
    dedent """
            Setup

            🧧  Usage

            clusterfiles setup
        """
    exit 0
}

#
# clone the templates directory and find/replace all  with $1
op_command_setup() {
    command_required 'git'
    command_required 'curl'

    export ASDF_PYAPP_INCLUDE_DEPS=1
    export ASDF_PLUGIN_URL_ansible=https://github.com/amrox/asdf-pyapp.git

    info " 💁 [ASDF] install with plugins"
    SHELL_PROFILE=$(get_shell_profile)

    if [ ! -f "$ASDF_BIN" ]; then
        info "===> ⤵️ ASDF not detected ... installing"
        git clone https://github.com/asdf-vm/asdf.git "$ASDF_HOME" --branch "$ASDF_VERSION"
        [ ! command -v asdf ] &>/dev/null && {
            info "====> ⚕️ adding to shell profile"
            append_uniquely "$SHELL_PROFILE" ". $ASDF_HOME/asdf.sh"
            append_uniquely "$SHELL_PROFILE" ". $ASDF_HOME/completions/asdf.bash"
        }
    fi

    source "$ASDF_BIN"

    for plugin in $(cut -d' ' -f1 ./.tool-versions); do
        info "==> 💁 [ASDF] Ensure ${plugin} plugin"
        if [ -d "$ASDF_HOME/plugins/${plugin}" ]; then
            info "===> 📦 attempting upgrade"
            asdf plugin-update "${plugin}"
        else
            info "===> ⤵️ installing"
            plugin_url_var=ASDF_PLUGIN_URL_${plugin//-/_}
            plugin_url="${!plugin_url_var}"

            if [ ${!plugin_url_var+x} ]; then
                info "====> 💁 [${plugin}] installed from ${plugin_url}"
            fi

            asdf plugin-add "${plugin}" "${plugin_url}"
        fi
    done

    PROCESSOR=$(get_processor)

    info "==> 💁 [ASDF] install tools"
    case $PROCESSOR in
    M1)
        info "===> 💁 [ASDF] install for M1"
        RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC \
            arch -arm64 \
            asdf install
        ;;

    x86_64)
        info "===> 💁 [ASDF] install for x86_64"
        asdf install
        ;;
    esac

    info "==> 💁 [ASDF] reshim globals"
    asdf reshim

    info "==> 💁 [ASDF] Done ✅"
}
