package DDG::Goodie::RandomPerson;
# ABSTRACT: Return random first and last name
use DDG::Goodie;
use Data::RandomPerson;

triggers start  => 'random';
zci answer_type => "rand";


name 'RandomPerson';
description 'returns a random first and last name';
category 'random';
topics 'programming';
primary_example_queries 'random person';
secondary_example_queries 'random name';
code_url 'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/RandomPerson.pm';
attribution github  => ['https://github.com/stelim', 'Stelim'],
            twitter => ['http://twitter.com/stefanlimbacher', 'Stefan Limbacher'];

handle remainder => sub {
    if ($_ = m{(person|name)}xmsi) {
        my $person = Data::RandomPerson->new()->create();
        return "$person->{title} $person->{firstname} $person->{lastname} $person->{age} $person->{dob}";
    }
    return;
};


1;