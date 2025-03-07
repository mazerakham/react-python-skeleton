# React-Python-Skeleton

A project template for creating web applications with a React frontend and Python FastAPI backend.

## Features

- React frontend with TypeScript
- Python FastAPI backend
- Automatic project setup with a single command
- Development server with hot reloading for both frontend and backend
- Git initialization with remote repository setup

## Getting Started

### Prerequisites

- Node.js (v16+)
- npm or yarn
- Python (v3.8+) - The script will try to use `python3` first, then fall back to `python`
- pip

### Creating a New Project

Run the initialization script:

```bash
./scripts/init-project.sh
```

Follow the prompts to:
1. Enter your app name
2. Optionally initialize a git repository
3. Optionally add a remote origin

### Running Your Project

After creating your project, you can run it with:

```bash
cd your-app-name
./scripts/run_project.sh
```

This will:
1. Set up a Python virtual environment if it doesn't exist
2. Install backend dependencies
3. Install frontend dependencies
4. Start both the backend and frontend servers

## Project Structure

The generated project will have the following structure:

```
your-app-name/
├── backend/         # Python FastAPI backend
│   ├── src/         # Source code
│   └── test/        # Test files
├── frontend/        # React frontend
│   ├── public/      # Static files
│   └── src/         # Source code
├── scripts/         # Utility scripts
└── cline/           # Cline context for AI assistance
```

## Development

- Backend API documentation is available at http://localhost:8000/docs
- Frontend development server runs at http://localhost:3000
- Edit `frontend/src/App.tsx` to modify the React frontend
- Edit `backend/src/your_app_name/app.py` to modify the FastAPI backend

## License

This project is open source and available under the [MIT License](LICENSE).
