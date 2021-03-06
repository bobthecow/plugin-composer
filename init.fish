function init --on-event init_composer
  # add Composer's global binaries to PATH
  if test -z "$COMPOSER_BIN_PATH"
    set -gx COMPOSER_BIN_PATH $HOME/.composer/vendor/bin
  end
  set PATH $COMPOSER_BIN_PATH $PATH

  # get composer path
  if test -z "$COMPOSER_BIN"
    if available "composer.phar"
      set -gx COMPOSER_BIN (which composer.phar)
    else if available "composer"
      set -gx COMPOSER_BIN (which composer)
    else
      echo "FAILED to find Composer! Please install composer.phar to your PATH."
    end
  end
end
