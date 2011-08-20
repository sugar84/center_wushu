package Wushu::Contacts;
use Mojo::Base 'Mojolicious::Controller';


sub info {
	my $self = shift;

	$self->render;
}

1;
