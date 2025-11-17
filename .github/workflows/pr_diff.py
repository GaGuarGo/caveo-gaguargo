if [ "${{ github.event_name }}" = "pull_request" ]; then
  echo "Obtendo diff do Pull Request..."

  DIFF=$(curl -s \
      -H "Authorization: token ${{ secrets.GITHUB_TOKEN }}" \
      -H "Accept: application/vnd.github.v3.diff" \
      "${{ github.event.pull_request.diff_url }}")

  echo "PR_NUMBER=${{ github.event.pull_request.number }}" >> $GITHUB_ENV

else
  echo "Obtendo diff entre main e HEAD..."
  
  git fetch origin main --depth=100
  DIFF=$(git diff origin/main...HEAD)

  echo "PR_NUMBER=0" >> $GITHUB_ENV
fi

# Trunca se muito grande (Snowflake tem limite)
DIFF_SHORT=$(echo "$DIFF" | head -c 16000)

printf "Diff obtido (tamanho: %d bytes)\n" "$(echo -n "$DIFF_SHORT" | wc -c)"

DIFF_B64=$(echo "$DIFF_SHORT" | base64 | tr -d '\n')
echo "DIFF_B64=$DIFF_B64" >> $GITHUB_ENV
