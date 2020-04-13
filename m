Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A8CB41A6956
	for <lists+linux-audit@lfdr.de>; Mon, 13 Apr 2020 18:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586793672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=korn5jK151VCmoawayZlsFIOTkf3DcPJI+MbHiIiX+o=;
	b=DCFtVZT5apFq0fNHUto3tElmhZffm3MLpfVoJm5kugrdQUJyQl00anTNIFdFoRHYOL1yYe
	W2srH0XISgbRLaWkP2ugIxwW+2OdlwY76/zum0vG1g5xNjebzE07l8l8Fe4LTND523Jqgm
	E2M/VJHQIM+KEgiTFGlUiMzdOqgaaTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-TdDYo3qwN-qtK6oNtQVUkg-1; Mon, 13 Apr 2020 12:01:09 -0400
X-MC-Unique: TdDYo3qwN-qtK6oNtQVUkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69D01107ACC7;
	Mon, 13 Apr 2020 16:00:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1792611D1D9;
	Mon, 13 Apr 2020 16:00:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DCF1934E3;
	Mon, 13 Apr 2020 16:00:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03DG0TkY015568 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Apr 2020 12:00:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5ED42166B2A; Mon, 13 Apr 2020 16:00:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D21A22166B2C
	for <linux-audit@redhat.com>; Mon, 13 Apr 2020 16:00:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F3E8868C8D
	for <linux-audit@redhat.com>; Mon, 13 Apr 2020 16:00:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-310-BFZ7dL1tP32pKijeKlBiYA-1; Mon, 13 Apr 2020 12:00:23 -0400
X-MC-Unique: BFZ7dL1tP32pKijeKlBiYA-1
Received: by mail-pl1-f178.google.com with SMTP id y12so3224497pll.2
	for <linux-audit@redhat.com>; Mon, 13 Apr 2020 09:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=u7rwAf3hgVMS0I50bQ9opgWPzBgiH4FwFaP8RnUVod4=;
	b=b9z3zgsMSAW24Pdh3vrS5faJv/g+FX0ZPqT3vUr7FPy7S6/gmgDgUamdzMgagHrb00
	PHGWPZTlWpNylLTYDVP1Rw1nXHKNmAUFPGVzdOtexhKjWhdbCRQXN3AoRvbVubv+ByHs
	GIxOY+WJGmadU1jFpvCtHm6AdokDtAf+qyE8EQa6ubCZKgPKhAzPUTHCYbkK78w4KwR+
	f4eg+EqStsMiDIsMrYMK1nPa98WS7kf1AHDDQqRStmV/ozJhmiVF3s0oU2O3LVoKcXnP
	gpJsAlj0tlJKIr4GmpuE4I4PLyqmk6VzWsRab6NhVMEnPpejPTp+PuwhlvUNm/9RqeaP
	btxg==
X-Gm-Message-State: AGi0Pubd4ddaWRV16OyZFsolGt6VCdvi3jiXZKPEZQtmdtTly7bkA8vy
	p450VKijLiI5Dm/yfTVWKKM0KtVLqtw=
X-Google-Smtp-Source: APiQypLetwGCU6Xw0j7FrTq/8H+Msw2I71asq8/XJIoC9APV1QzJtsWNVD7vrtoxoZFlUWVvajvtDg==
X-Received: by 2002:a17:90a:22e9:: with SMTP id
	s96mr20392395pjc.46.1586793620158; 
	Mon, 13 Apr 2020 09:00:20 -0700 (PDT)
Received: from [192.168.0.162] ([216.158.248.173])
	by smtp.gmail.com with ESMTPSA id
	n21sm8529066pgf.36.2020.04.13.09.00.18 for <linux-audit@redhat.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2020 09:00:19 -0700 (PDT)
Subject: Re: auditing audispd vs kubernetes daemonsets
To: linux-audit@redhat.com
References: <CAOxyEpno-VdVb3sqX8q7hGX7L3fgEOLpf9j25u_o+mcezZ+EBg@mail.gmail.com>
	<4644525.9UYIb4EAcv@x2>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <ccc1b624-f8d9-0489-7252-64e8dc3131f8@magitekltd.com>
Date: Mon, 13 Apr 2020 10:00:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4644525.9UYIb4EAcv@x2>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0006229360840317903=="

This is a multi-part message in MIME format.
--===============0006229360840317903==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="------------EE87A7061227B775E310B59E"

This is a multi-part message in MIME format.
--------------EE87A7061227B775E310B59E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/13/20 7:57 AM, Steve Grubb wrote:

>> Can a Daemonset be used instead of audispd, or are there reasons audispd
>> should be used over a Daemonset that some of us just aren't aware of?
> Entirely up to the system architect and their security requirements.

Will the Daemonset code be taken through Common Criteria evaluation?

LCB

--=20
Lenny Bruzenak
MagitekLTD


--------------EE87A7061227B775E310B59E
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>On 4/13/20 7:57 AM, Steve Grubb wrote:<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:4644525.9UYIb4EAcv@x2">
      <blockquote type=3D"cite" style=3D"color: #000000;">
        <pre class=3D"moz-quote-pre" wrap=3D"">Can a Daemonset be used inst=
ead of audispd, or are there reasons audispd
should be used over a Daemonset that some of us just aren't aware of?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Entirely up to the system arch=
itect and their security requirements.</pre>
    </blockquote>
    <p>Will the Daemonset code be taken through Common Criteria
      evaluation?</p>
    <p>LCB<br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------EE87A7061227B775E310B59E--

--===============0006229360840317903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0006229360840317903==--

