package Wushu::Main;
use Mojo::Base 'Mojolicious::Controller';


sub info {
	my $self = shift;

	$self->render( dump => $self->dumper(\%ENV) );
}

1;
