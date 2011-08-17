package Wushu::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
	my $self = shift;

	# Render template "example/welcome.html.ep" with message
	$self->render(message => 'Welcome to the Mojolicious Web Framework!');
}

sub list {
	my $self = shift;
	my $conf = $self->app->conf;
	warn $self->dumper( $conf );

	$self->render(
		message => "it lists conf of project",
		conf    => $conf,
	);
}

1;
