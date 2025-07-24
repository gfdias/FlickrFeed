#!/bin/bash

# FlickrFeed Test Script
# This script runs the same tests that CI runs locally

set -e

echo "🧪 Running FlickrFeed Tests"
echo "=========================="

# Check if we're in the right directory
if [ ! -f "FlickrFeed.xcworkspace" ]; then
    echo "❌ Error: FlickrFeed.xcworkspace not found. Please run this script from the project root."
    exit 1
fi

# Install dependencies if needed
if [ ! -d "Pods" ]; then
    echo "📦 Installing CocoaPods dependencies..."
    pod install
fi

# Run SwiftLint if available
if command -v swiftlint &> /dev/null; then
    echo "🔍 Running SwiftLint..."
    swiftlint lint
else
    echo "⚠️  SwiftLint not found. Install with: brew install swiftlint"
fi

# Build and test
echo "🏗️  Building and testing..."
xcodebuild \
    -workspace FlickrFeed.xcworkspace \
    -scheme FlickrFeed \
    -destination 'platform=iOS Simulator,name=iPhone 14,OS=latest' \
    -configuration Debug \
    clean build test \
    CODE_SIGNING_REQUIRED=NO \
    CODE_SIGN_IDENTITY="" \
    PROVISIONING_PROFILE=""

echo "✅ All tests passed!"