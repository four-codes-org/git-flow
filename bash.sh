GITHUB_REPOSITORY="four-codes-org/git-flow"
GIT_TOKEN="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"
GIT_API_VERSION="2022-11-28"

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/branches" | jq -r '.[] | select(.name | contains("release") | not)'


curl -L -s -H "Accept: application/vnd.github+json"   -H "Authorization: Bearer ${GIT_TOKEN}"   -H "X-GitHub-Api-Version: ${GIT_API_VERSION}"   "https://api.github.com/repos/${GITHUB_REPOSITORY}/branches" | jq -r '[.[] | select(.name | startswith("release/") and match("^release/([0-9]+\\.){2}[0-9]+$"))] | max_by(.name | split("/")[1] | split(".") | map(tonumber)) | .name | split("/")[1]'
