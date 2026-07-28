class NotImplementedException(Exception):
    def __init__(self, method_name=""):
        self.message = (
            f"Method '{method_name}' not implemented"
            if len(method_name) > 0
            else "Method not implemented"
        )
        super().__init__(self.message)

    def __str__(self):
        return f"{self.message}"
