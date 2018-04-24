# Using a machine localhost:8889 to create a tunnel to remote machine localhost:8888
ssh -L localhost:8889:localhost:8888 user@ip

# Observe the used port
netstat -tupln 

# Create a jupyter kernel with virtalenv python
python -m ipykernel install --user --name=venv
