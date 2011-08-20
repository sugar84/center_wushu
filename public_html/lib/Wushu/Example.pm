package Wushu::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
	my $self = shift;

	$self->render(message => 'Welcome to the Mojolicious Web Framework!');
}

sub list {
	my $self = shift;
	my $conf = $self->app->conf;

	$self->render(
		message => "it lists conf of project",
		conf    => $conf,
	);
}

1;
