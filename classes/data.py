class Data():
    def __init__(self):
        str_data = 'normal string'
        int_data = 2
        float_data = 1.50
        list_data = [str_data, int_data, float_data]
        nested_list = [int_data, float_data, list_data]
        dictionary = {
            'int': int_data,
            'str': str_data,
            'float': float_data,
            'list': list_data,
            'nested list': nested_list
        }
        self.data = dictionary