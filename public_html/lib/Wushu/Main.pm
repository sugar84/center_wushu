package Wushu::Main;
use Mojo::Base 'Mojolicious::Controller';


sub info {
	my $self = shift;

	$self->render( 
		dump => $self->dumper(\%ENV),
		ps   => join("", qx(ps aux)),
		ls   => join("", qx(ls -la)),
		pwd  => join("", qx(pwd))
		who  => join("", qx(who))
		ls__ => join("", qx(ls ../))
	);
}

1;
