use lib './src/lib';
use Perplacer;

sub MAIN (
  Str $input,
  Regex :$replace-target?,
  Str :$replacement?,
  Bool :$replace-once
) {
  my Options $default = Options.new;
  my Options $options = Options.new(
    replaceTarget => fromDefault($default.replaceTarget, $replace-target),
    replacement   => fromDefault($default.replacement, $replacement),
    replaceOnce   => fromDefault($default.replaceOnce, $replace-once)
  );

  say Perplacer::run($input, $options)
}

sub fromDefault ($default, $optional?) {(defined $optional) ?? $optional !! $default}