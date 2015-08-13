require './hdb'

idea_pocket = Company.create(name: 'IdeaPocket')
Series.create(name: 'IPZ',    company_id: idea_pocket.id)
Series.create(name: 'IPTD',   company_id: idea_pocket.id)
