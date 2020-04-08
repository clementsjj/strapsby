start:
	tmux \
    new-session -s strapiserve  'cd backend/ && yarn strapi dev' \; \
    split-window 'cd frontend/ && echo Changing Directory... && sleep 5 && gatsby develop' \; 