package Wushu::Coach;
use Mojo::Base 'Mojolicious::Controller';


sub list {
	my $self = shift;

	$self->render;
}

1;
