#!/bin/bash

# Resume Parser Streamlit App Runner
echo "🚀 Starting Resume Parser App..."

# Check if virtual environment exists
if [ ! -d "myenv" ]; then
    echo "⚠️  Virtual environment 'myenv' not found!"
    echo "Please make sure you have created and activated your virtual environment."
    exit 1
fi

# Activate virtual environment
source myenv/bin/activate

# Install requirements if needed
if [ -f "requirements.txt" ]; then
    echo "📦 Installing/updating requirements..."
    pip install -r requirements.txt
fi

# Check if OpenAI API key is set
if [ -z "$OPENAI_API_KEY" ]; then
    echo "⚠️  OPENAI_API_KEY environment variable is not set!"
    echo "Please set your OpenAI API key:"
    echo "export OPENAI_API_KEY='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'"
    exit 1
fi

# Check if resume chunk files exist
if ! ls resume_chunk_*.json 1> /dev/null 2>&1; then
    echo "⚠️  No resume chunk files found!"
    echo "Please make sure you have the resume_chunk_*.json files in the current directory."
    exit 1
fi

echo "✅ All checks passed!"
echo "🌐 Starting Streamlit app..."

# Run the Streamlit app
streamlit run resume_parser_app.py
