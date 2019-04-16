<?hh // partial

namespace Hack\UserDocumentation\API\Examples\Map\FilterWithKey;

$m = Map {
  'red' => '#ff0000',
  'green' => '#00ff00',
  'blue' => '#0000ff',
  'yellow' => '#ffff00',
  'purple' => '#663399',
};

$primary_colors = Set {'red', 'green', 'blue'};

// Filter non-primary colors with a 100% red component
$non_primary_red_100 = $m->filterWithKey(
  ($color, $hex_code) ==> {
    $is_primary = $primary_colors->contains($color);
    $has_full_red_component = strpos($hex_code, '#ff') === 0;
    return $has_full_red_component && !$is_primary;
  },
);

var_dump($non_primary_red_100);
