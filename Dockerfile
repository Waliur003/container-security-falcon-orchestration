# Step 1: Use a minimal, audited base image to minimize vulnerability surface area
FROM alpine:3.19

# Step 2: Install python runtime dependencies
RUN apk add --no-cache python3

# Step 3: Create a isolated system user/group to eliminate root runtime exploitation
RUN addgroup -S falcongroup && adduser -S falconuser -G falcongroup

# Step 4: Establish the isolated app directory
WORKDIR /app
COPY app.py /app/

# Step 5: Pivot the execution context entirely away from root privileges
USER falconuser

# Step 6: Define execution parameters
CMD ["python3", "app.py"]