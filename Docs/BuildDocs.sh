#!/bin/sh

swift package --allow-writing-to-directory "$PWD" \
    generate-documentation --product Rapid --disable-indexing \
    --output-path "$PWD/DerivedData"

echo '<script>window.location.href += "/documentation/rapid"</script>' > DerivedData/index.html
