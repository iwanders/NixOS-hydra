use strict;
use Cwd;
use Setup;
use TestScmInput;

(my $datadir, my $pgsql) = test_init();

require Hydra::Schema;
require Hydra::Model::DB;

use Test2::V0;

my $db = Hydra::Model::DB->new;
hydra_setup($db);

# Tests the creation of a Hydra jobset using a bzr checkout as input.
testScmInput(
  type => 'bzr-checkout',
  expr => 'bzr-checkout-input.nix',
  uri => 'bzr-checkout-repo',
  update => 'jobs/bzr-checkout-update.sh',

  # directories
  datadir => $datadir,
  testdir => getcwd,
);

done_testing;