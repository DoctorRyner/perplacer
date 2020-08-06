unit module Perplacer;

class Options is export {
  has Regex $.replaceTarget = /\S/;
  has Str $.replacement = "?";
  has Bool $.replaceOnce = False;
}

our sub run (Str $input, Options $options --> Str) {
  $options.replaceOnce
    ?? $input.subst($options.replaceTarget, $options.replacement)
    !! $input.subst($options.replaceTarget, $options.replacement, :global)
}