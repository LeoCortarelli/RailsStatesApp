parana = State.create(name: 'Paraná')
santa_catarina = State.create(name: 'Santa Catarina')
rio_grande_do_sul = State.create(name: 'Rio Grande do Sul')

parana.cities.create([{ name: 'Curitiba' }, { name: 'Londrina' }, { name: 'Maringá' }])
santa_catarina.cities.create([{ name: 'Florianópolis' }, { name: 'Joinville' }, { name: 'Blumenau' }])
rio_grande_do_sul.cities.create([{ name: 'Porto Alegre' }, { name: 'Caxias do Sul' }, { name: 'Pelotas' }])
