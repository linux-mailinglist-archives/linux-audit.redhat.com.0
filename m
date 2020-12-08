Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7514C2D2DEA
	for <lists+linux-audit@lfdr.de>; Tue,  8 Dec 2020 16:11:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-4Ps7bskOMMCFKh4dOyRQpA-1; Tue, 08 Dec 2020 10:11:28 -0500
X-MC-Unique: 4Ps7bskOMMCFKh4dOyRQpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EBC0A0C33;
	Tue,  8 Dec 2020 15:10:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47E056E521;
	Tue,  8 Dec 2020 15:10:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2478E4BB7B;
	Tue,  8 Dec 2020 15:10:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8F9J1o028019 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 10:09:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9D6A110F0C6; Tue,  8 Dec 2020 15:09:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F7B110F0C9
	for <linux-audit@redhat.com>; Tue,  8 Dec 2020 15:09:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48EA080B2C1
	for <linux-audit@redhat.com>; Tue,  8 Dec 2020 15:09:17 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-335-W841UrnxMEOU_8XyIrRHhg-1; Tue, 08 Dec 2020 10:09:13 -0500
X-MC-Unique: W841UrnxMEOU_8XyIrRHhg-1
Received: by mail-il1-f178.google.com with SMTP id 2so12640907ilg.9
	for <linux-audit@redhat.com>; Tue, 08 Dec 2020 07:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=/X6SGz+18jjBsGxBquLxO/peOpC9v10Da6vjeXoA9Dc=;
	b=II8JLR8aR3HtJlQv6XyxMVBrbmPSIJAXnd/elc4IR6rssl2RFLMojCDA0exItzyro+
	kPrtM8QvUG6l04tNY7SzAmuFR0udIsSWgy4oKwIiRY6YLTgAfsoAq5QsPWSdR33Os8pY
	81uHX5Fdsi3pQNeT/tjcAH+nOTXntEDMw93ElRQCs1AmVG4FSQbqDlmUnDClF6yrtaic
	2OUrQBSnCS/kvQELP97VMX21Tx0iKE5ggpwXp5T3ZujC6tRQYAzrHRPYHfSCf1rhBPYB
	o6CMltcLmtf+1OZBrgrBXaYn7lyXHrBrFezk2kA/KPJ6XvncNO9WJk2P4oU9YgGHYr5o
	AUCA==
X-Gm-Message-State: AOAM533W90FFjjVBdQadfYrrTnT76ktKpfOIVgSNWLoaAA9MDM42wVLo
	R9abDuGGx85QE90cZxjwpLF5aGbR0rJRK/oR
X-Google-Smtp-Source: ABdhPJzgSj/0YZ4COylSOvVQ9dnVrDgkPoaavVVa1jYtU1pNdzzFJZo6+UkBM5oUa1m6bp6njTne5A==
X-Received: by 2002:a92:2005:: with SMTP id j5mr25854080ile.271.1607440151751; 
	Tue, 08 Dec 2020 07:09:11 -0800 (PST)
Received: from ?IPv6:2607:f768:200:b:ffff:ffff:ffff:edd8?
	([2607:f768:200:b:ffff:ffff:ffff:edd8])
	by smtp.gmail.com with ESMTPSA id
	c14sm9873287ili.15.2020.12.08.07.09.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 08 Dec 2020 07:09:11 -0800 (PST)
Subject: Re: lost events on boot
To: Richard Guy Briggs <rgb@redhat.com>
References: <d5da10fe-8a97-a43a-6178-827dfadbe574@magitekltd.com>
	<20201208005640.GO986374@madcap2.tricolour.ca>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <6a1d96bc-4cab-a7df-25fe-113c29352aa8@magitekltd.com>
Date: Tue, 8 Dec 2020 08:09:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208005640.GO986374@madcap2.tricolour.ca>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <linux-audit@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============2074219285573159608=="

This is a multi-part message in MIME format.
--===============2074219285573159608==
Content-Type: multipart/alternative;
	boundary="------------4AD1FA0A246BA99EDEC86A86"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4AD1FA0A246BA99EDEC86A86
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/7/20 5:56 PM, Richard Guy Briggs wrote:

>>     The kernel is supplying the serial number (right?), so is it
>>     discarding the events without assigning a serial number?
> Yes, the kernel assigns the serial numbers.  Sometimes.  Some buffers
> never get allocated and therefore no serial number assigned due to full
> queues or memory pressure.  Other buffers get dropped when queues are
> full and there is no choice but to drop a message.  This is true before
> and after Paul's queue re-write.
>
>>   * Do I have something wrong with my kernel boot parameters?
> Not likely.  From what you have described above it sounds like you have
> done what you can.
>
>> I'd have thought that 8k buffers would be enough, and certainly if I only
>> have 515 events, should be. Unless, each record inside the event is adding.
> If your kernel command line is larger than your lost count and your
> serial number when you check it after boot, you should be in good shape.
>
>> I also then counted each record, not just events, and got around 1600, so
>> I'd have thought that even multi-record events would have fit. I guess that
>> depends on the buffer size.
> Good thinking, and you are correct.  That backlog limit may need to be
> increased for more recent kernels since there are more events caught and
> some events have more records.
>
>> Appreciate the help in advance; thanks.
> I hope this helps.
>

Yes, it does help. Thanks Richard!

LCB

-- 
Lenny Bruzenak
MagitekLTD


--------------4AD1FA0A246BA99EDEC86A86
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 12/7/20 5:56 PM, Richard Guy Briggs wrote:<br>
    </p>
    <blockquote type="cite"
      cite="mid:20201208005640.GO986374@madcap2.tricolour.ca">
      <blockquote type="cite" style="font-size: large; color: #000000;">
        <pre class="moz-quote-pre" wrap="">   The kernel is supplying the serial number (right?), so is it
   discarding the events without assigning a serial number?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Yes, the kernel assigns the serial numbers.  Sometimes.  Some buffers
never get allocated and therefore no serial number assigned due to full
queues or memory pressure.  Other buffers get dropped when queues are
full and there is no choice but to drop a message.  This is true before
and after Paul's queue re-write.

</pre>
      <blockquote type="cite" style="font-size: large; color: #000000;">
        <pre class="moz-quote-pre" wrap=""> * Do I have something wrong with my kernel boot parameters?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Not likely.  From what you have described above it sounds like you have
done what you can.

</pre>
      <blockquote type="cite" style="font-size: large; color: #000000;">
        <pre class="moz-quote-pre" wrap="">I'd have thought that 8k buffers would be enough, and certainly if I only
have 515 events, should be. Unless, each record inside the event is adding.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">If your kernel command line is larger than your lost count and your
serial number when you check it after boot, you should be in good shape.

</pre>
      <blockquote type="cite" style="font-size: large; color: #000000;">
        <pre class="moz-quote-pre" wrap="">I also then counted each record, not just events, and got around 1600, so
I'd have thought that even multi-record events would have fit. I guess that
depends on the buffer size.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Good thinking, and you are correct.  That backlog limit may need to be
increased for more recent kernels since there are more events caught and
some events have more records.

</pre>
      <blockquote type="cite" style="font-size: large; color: #000000;">
        <pre class="moz-quote-pre" wrap="">Appreciate the help in advance; thanks.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I hope this helps.

</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, it does help. Thanks Richard!</p>
    <p>LCB<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------4AD1FA0A246BA99EDEC86A86--

--===============2074219285573159608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2074219285573159608==--

