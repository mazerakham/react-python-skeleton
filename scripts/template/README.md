# {{APP_NAME}}

A modern web application with React frontend and Python FastAPI backend.

## Project Structure

```
{{APP_NAME}}/
├── backend/         # Python FastAPI backend
├── frontend/        # React frontend
├── scripts/         # Utility scripts
└── cline/           # Cline context for AI assistance
```

## Getting Started

### Prerequisites

- Node.js (v16+)
- npm or yarn
- Python (v3.8+)
- pip

### Setup

1. **Backend Setup**

```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -e .
pip install -r requirements.txt
```

2. **Frontend Setup**

```bash
cd frontend
npm install
```

### Running the Application

You can run both the frontend and backend with a single command:

```bash
./scripts/run_project.sh
```

This will start:
- Backend server at http://localhost:8000
- Frontend development server at http://localhost:3000

### Manual Startup

If you prefer to run the servers manually:

**Backend:**
```bash
cd backend
source venv/bin/activate  # On Windows: venv\Scripts\activate
uvicorn {{PYTHON_PACKAGE_NAME}}.app:app --reload
```

**Frontend:**
```bash
cd frontend
npm start
```

## Development

- Backend API documentation is available at http://localhost:8000/docs
- Edit `frontend/src/App.tsx` to modify the React frontend
- Edit `backend/src/{{PYTHON_PACKAGE_NAME}}/app.py` to modify the FastAPI backend

## Testing

**Backend Tests:**
```bash
cd backend
pytest
```

**Frontend Tests:**
```bash
cd frontend
npm test
```

## License

This project is open source and available under the [MIT License](LICENSE).
