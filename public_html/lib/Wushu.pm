package Wushu;
use Mojo::URL;
use Mojo::Base 'Mojolicious';

has conf => sub {do "conf/app.conf"};

# This method will run once at server start
sub startup {
	my $self = shift;

	# $self->plugin('pod_renderer');
	$self->hook( before_dispatch => sub {
		my $self = shift;
		# notice: url must be fully-qualified or absolute, ending in '/' matters.
		$self->req->url->base( Mojo::URL->new(q{http://sugar.fluxflex.com/}) );
	});
	$self->app->log->handle(\*STDERR);
	$self->app->log->warn( $self->dumper(\%ENV) );

	# Routes
	# о центре, направления и стили, инструктора, видео, фото, новости, статьи, ссылки, контакты
	my $r = $self->routes;

	$r->route( '/'         )->to( 'main#info'     );
	$r->route( '/styles'   )->to( 'styles#info'   );
	$r->route( '/coach'    )->to( 'coach#list'    );
	$r->route( '/video'    )->to( 'video#list'    );
	$r->route( '/news'     )->to( 'news#list'     );
	$r->route( '/articles' )->to( 'aritcles#list' );
	$r->route( '/refs'     )->to( 'refs#info'     );
	$r->route( '/contacts' )->to( 'contacts#info' );

	$r->route('/welcome')->to('example#welcome');
}

1;
