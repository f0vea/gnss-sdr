/*!
 * \file interleaved_byte_to_complex_short.h
 * \brief Adapts a byte (8-bits) interleaved sample stream into a std::complex<short> stream
 * \author Javier Arribas (jarribas(at)cttc.es)
 *
 * -------------------------------------------------------------------------
 *
 * Copyright (C) 2010-2019  (see AUTHORS file for a list of contributors)
 *
 * GNSS-SDR is a software defined Global Navigation
 *          Satellite Systems receiver
 *
 * This file is part of GNSS-SDR.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 * -------------------------------------------------------------------------
 */

#ifndef GNSS_SDR_INTERLEAVED_BYTE_TO_COMPLEX_SHORT_H
#define GNSS_SDR_INTERLEAVED_BYTE_TO_COMPLEX_SHORT_H

#include <memory>
#include <gnuradio/sync_decimator.h>

class interleaved_byte_to_complex_short;

using interleaved_byte_to_complex_short_sptr = std::shared_ptr<interleaved_byte_to_complex_short>;

interleaved_byte_to_complex_short_sptr make_interleaved_byte_to_complex_short();

/*!
 * \brief This class adapts a short (16-bits) interleaved sample stream
 * into a std::complex<short> stream
 */
class interleaved_byte_to_complex_short : public gr::sync_decimator
{
public:
    int work(int noutput_items,
        gr_vector_const_void_star &input_items,
        gr_vector_void_star &output_items);

private:
    friend interleaved_byte_to_complex_short_sptr make_interleaved_byte_to_complex_short();
    interleaved_byte_to_complex_short();
};

#endif  // GNSS_SDR_INTERLEAVED_BYTE_TO_COMPLEX_SHORT_H
