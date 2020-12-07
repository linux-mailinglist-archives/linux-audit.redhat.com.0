Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB1F2D1E56
	for <lists+linux-audit@lfdr.de>; Tue,  8 Dec 2020 00:29:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-3dymyAMqPPqpv1YbvBGPSA-1; Mon, 07 Dec 2020 18:29:12 -0500
X-MC-Unique: 3dymyAMqPPqpv1YbvBGPSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1986100C600;
	Mon,  7 Dec 2020 23:29:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8193F5C1A1;
	Mon,  7 Dec 2020 23:29:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 429514BB7B;
	Mon,  7 Dec 2020 23:29:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7NT2Ra003519 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 18:29:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2CF07112C266; Mon,  7 Dec 2020 23:29:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28A2F112C256
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 23:28:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1D201008047
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 23:28:59 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-431-CJWzeYCWNjGj1DRYtbJM8A-1; Mon, 07 Dec 2020 18:28:56 -0500
X-MC-Unique: CJWzeYCWNjGj1DRYtbJM8A-1
Received: by mail-io1-f45.google.com with SMTP id z5so15126534iob.11
	for <linux-audit@redhat.com>; Mon, 07 Dec 2020 15:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=Kf2eDpeTAJm3dnsVtLW+eQh9K77N26OVB+3Nv8mN5b8=;
	b=R6hpEQzhxqGn/1MeaFKFPOnWwInPchsaNOv9EDPb/DTsZWh71LEjWZSLjnksYYxEx+
	kJbNAL280HbNdxl0MiU4FRU8gDjG4m0+7PHBZkDRiX73MWmmJ6Qtc+/9vHoALV5/rtR5
	vQ65PVA7sqHVgcBMUJOZIpilPrAPU8lIhVybtUVvvO2vgWbeqyAWBE0hRSOMDiqfWuBj
	r5PoQiyRpey0EbOMwpW1c/X5eI6ZCsygR7sZweWglibwIv38hNjXQ3waKSUKLlVTtciq
	7mKbz9vQLG0yQMpYF10JOwvKum0BlE5ZK6DvasG+iPBcd4BaJQ+LeLvyMzZBqwdWm5rz
	LZug==
X-Gm-Message-State: AOAM532Jvcmh9EJEuZ8K+93qtcX9kzNriu9myYxJNXEcxV2cKir6Gt6p
	Z2h+/gxvpwyfpvF9HrBlFSW8JZKihdpzD0eJ
X-Google-Smtp-Source: ABdhPJybWSTOmIq3A+QsNQTmuRKUTodP/IWAIHWNUQH+TmfyZbJZbtA09YX9Jcb/0/yF3Oc1WIc2pg==
X-Received: by 2002:a02:2b09:: with SMTP id h9mr23756911jaa.101.1607383735625; 
	Mon, 07 Dec 2020 15:28:55 -0800 (PST)
Received: from ?IPv6:2607:f768:200:b:ffff:ffff:ffff:edd8?
	([2607:f768:200:b:ffff:ffff:ffff:edd8])
	by smtp.gmail.com with ESMTPSA id n1sm8310064ilm.72.2020.12.07.15.28.54
	for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 07 Dec 2020 15:28:55 -0800 (PST)
To: "Linux-audit@redhat.com" <linux-audit@redhat.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
Subject: lost events on boot
Message-ID: <d5da10fe-8a97-a43a-6178-827dfadbe574@magitekltd.com>
Date: Mon, 7 Dec 2020 16:28:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============0279987909891209512=="

This is a multi-part message in MIME format.
--===============0279987909891209512==
Content-Type: multipart/alternative;
	boundary="------------2E201EF78E3B70E69B68B7D7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2E201EF78E3B70E69B68B7D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies if this has been answered. I searched and found some 
relevant-looking dialog 2 years ago (on 12/14/2018) that Paul/RGB/Ondrej 
were discussing, however I do not see the answer.

I'm running userspace 2.8.5 , kernel 3.10.0-1160.

I have boot parameters "audit=1 ... audit_backlog_limit=8192" .

Immediately after boot, I use "auditctl -s and see hundreds (varies, 
between 119-330) of lost records.


So I cleaned out all the audit data, rebooted again and examined the events.

They are numbered sequentially 1-515. I counted the events and they 
match (515).


So my questions are these:

  * Is this "lost" value accurate?
  * If the numbering doesn't indicate any gaps, what does that tell me?
    The kernel is supplying the serial number (right?), so is it
    discarding the events without assigning a serial number?
  * Do I have something wrong with my kernel boot parameters?

I'd have thought that 8k buffers would be enough, and certainly if I 
only have 515 events, should be. Unless, each record inside the event is 
adding. I also then counted each record, not just events, and got around 
1600, so I'd have thought that even multi-record events would have fit. 
I guess that depends on the buffer size.

Appreciate the help in advance; thanks.

LCB

-- 
Lenny Bruzenak
MagitekLTD


--------------2E201EF78E3B70E69B68B7D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Apologies if this has been answered. I searched and found some
      relevant-looking dialog 2 years ago (on 12/14/2018) that
      Paul/RGB/Ondrej were discussing, however I do not see the answer.</p>
    <p>I'm running userspace 2.8.5 , kernel 3.10.0-1160.<br>
    </p>
    <p>I have boot parameters "audit=1 ... audit_backlog_limit=8192" .</p>
    <p>Immediately after boot, I use "auditctl -s and see hundreds
      (varies, between 119-330) of lost records.</p>
    <p><br>
    </p>
    <p>So I cleaned out all the audit data, rebooted again and examined
      the events.<br>
    </p>
    <p>They are numbered sequentially 1-515. I counted the events and
      they match (515).<br>
    </p>
    <p><br>
    </p>
    <p>So my questions are these:</p>
    <ul>
      <li>Is this "lost" value accurate?</li>
      <li>If the numbering doesn't indicate any gaps, what does that
        tell me? The kernel is supplying the serial number (right?), so
        is it discarding the events without assigning a serial number?</li>
      <li>Do I have something wrong with my kernel boot parameters?</li>
    </ul>
    <p>I'd have thought that 8k buffers would be enough, and certainly
      if I only have 515 events, should be. Unless, each record inside
      the event is adding. I also then counted each record, not just
      events, and got around 1600, so I'd have thought that even
      multi-record events would have fit. I guess that depends on the
      buffer size. <br>
    </p>
    <p>Appreciate the help in advance; thanks.</p>
    <p>LCB<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------2E201EF78E3B70E69B68B7D7--

--===============0279987909891209512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0279987909891209512==--

