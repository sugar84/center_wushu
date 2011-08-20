package Wushu::Main;
use Mojo::Base 'Mojolicious::Controller';


sub info {
	my $self = shift;

	$self->render( 
		dump => $self->dumper(\%ENV),
		ps   => join("", qx(ps ux)),
		ls   => join("", qx(ls -la)),
		pwd  => join("", qx(pwd)),
		who  => join("", qx(who)),
		whoa => join("", qx(whoami)),
		ls__ => join("", qx(ls ../../gary/)),
	);
}

1;
