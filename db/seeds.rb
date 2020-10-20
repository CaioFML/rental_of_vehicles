User.create!(name: 'Administrador',
             email: 'admin@example.com',
             password: '123456',
             password_confirmation: '123456') if Rails.env.development?