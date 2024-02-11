increment_version() {
    local RELEASE_ORDER="$1"
    local VERSION="$2"
    local SEGMENT="$3"

    IFS='.' read -r -a parts <<< "$VERSION"

    if [ "$SEGMENT" == "middle" ]; then
        ((parts[1]++))
    elif [ "$SEGMENT" == "last" ]; then
        ((parts[2]++))
    else
        echo "Invalid SEGMENT. Please use 'middle' or 'last'."
        exit 1
    fi

    NEW_VERSION="${RELEASE_ORDER}.${parts[1]}.${parts[2]}"
    echo "${NEW_VERSION}"
    }

    # if [[ "${CI_COMMIT_BRANCH}" == "develop" ]]; then
    #     VERSION_INCREMENT="middle"
    # else
    #     VERSION_INCREMENT="last"
    # fi
    RELEASE_ORDER=2
    LAST_RELEASE_BRANCH_NAME="1.9.0"
    VERSION_INCREMENT="middle"
    RELEASE_VERSION=$(increment_version "${RELEASE_ORDER}" "${LAST_RELEASE_BRANCH_NAME}" "${VERSION_INCREMENT}")
    echo "${RELEASE_VERSION}"