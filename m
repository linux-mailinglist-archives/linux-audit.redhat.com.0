Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 87EF9EC533
	for <lists+linux-audit@lfdr.de>; Fri,  1 Nov 2019 15:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572620332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dZgrWknaFEzTJCQk+z6OLYYic2nPA0H7Djf7tTaup28=;
	b=K2eWDo4tdoq+ffWJhS019xkrir3IXjy4y9eh6Udpx41Mud0h171C5siFkbYNL6BLA1pbSL
	MkV9M0QGrt038j5ZR8moirPLWt/0wD6GR2itzgVt7CSu0PiI1o3Cn5nI8y+3ytwe7z+Rdn
	8oh2bisG4nyxRxqJtNYkPG+/A2wejQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-Rj_Y65EoPZqe30NENRrhWg-1; Fri, 01 Nov 2019 10:58:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9EC8107ACC2;
	Fri,  1 Nov 2019 14:58:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 955F060876;
	Fri,  1 Nov 2019 14:58:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2302F18034E9;
	Fri,  1 Nov 2019 14:58:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA1EwFgA013688 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 1 Nov 2019 10:58:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B211C19757; Fri,  1 Nov 2019 14:58:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC96919C5B
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 14:58:10 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0D3A3001870
	for <linux-audit@redhat.com>; Fri,  1 Nov 2019 14:58:09 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id e3so2378222plt.7
	for <linux-audit@redhat.com>; Fri, 01 Nov 2019 07:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=MqYpeeUfi/ZJH65J7tiFJkna8NTNhmqQzVRPS+ynhYQ=;
	b=UBHSEZE29esH+a7/S5e177HFU4rEhAOLGwRvBWy2NGNL2JR0tv+8LDRceOm8pM2qy5
	kIZoVn0Jr0lcqDiRP3eYvgxeB0FyO6c+uSlj83AcWcUhQkksdxvzMdYY9zM8OVfQDtYw
	z3to2SIdfzOmxOiydg4f5nCG1p12tyugF6/BZkFN4YQKeG5hRPIwxSgW4H33ySHcEMIO
	QQ3q79KuioLL3W5DsEL2otZpGMzPN3Kt49UjWMKkCH9CdkUMKHFVMSuNAcsnL3Eq0Ekt
	vYIvILiXJqFV/6RjSS91XXwT5IgN2bQ6RvXWgNBrTVErijmC8q1tQN5IJbBaBZIyPF+q
	GMrA==
X-Gm-Message-State: APjAAAWHtAqwz15mybSRZ0yFQB5wXMr6hsBW+JGd4muuM+5rshp0nDZA
	nVMNsb/p/g4RpfcRk18H85v/XX94oTo=
X-Google-Smtp-Source: APXvYqxNJxHLNIHO7/MKSpW3C5i8cW0wMF+RkayhrTV7xJLyUyptvF5Hf7hf27cqrlXMAju8sHikxA==
X-Received: by 2002:a17:902:36a:: with SMTP id
	97mr13026852pld.63.1572620289070; 
	Fri, 01 Nov 2019 07:58:09 -0700 (PDT)
Received: from [192.168.1.151] ([47.187.53.142])
	by smtp.gmail.com with ESMTPSA id v1sm9755276pjd.22.2019.11.01.07.58.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2019 07:58:08 -0700 (PDT)
Subject: Re: [PATCH] audit: set context->dummy even when audit is off
To: Steve Grubb <sgrubb@redhat.com>, linux-audit@redhat.com
References: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<3063279.ZKBa9cPvsK@x2>
	<f54be09d-297b-108a-533e-324a04fd1f6d@magitekltd.com>
	<786313584.jd3umIO2dN@x2>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <8115d826-9bdf-a7b2-2766-9b55916491ac@magitekltd.com>
Date: Fri, 1 Nov 2019 09:58:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <786313584.jd3umIO2dN@x2>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 01 Nov 2019 14:58:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 01 Nov 2019 14:58:09 +0000 (UTC) for IP:'209.85.214.172'
	DOMAIN:'mail-pl1-f172.google.com'
	HELO:'mail-pl1-f172.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.214.172 mail-pl1-f172.google.com 209.85.214.172
	mail-pl1-f172.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Rj_Y65EoPZqe30NENRrhWg-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============0408847708833041239=="

This is a multi-part message in MIME format.
--===============0408847708833041239==
Content-Type: multipart/alternative;
	boundary="------------68156D995F683801F109B0D7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------68156D995F683801F109B0D7
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On 11/1/19 9:49 AM, Steve Grubb wrote:

>> +1 for me, except I would also question why it would even listen, as to
>> me it seems that implies storage.
>>
>> If that's true, I would want to be able to disable it as I do not want
>> audit events stored elsewhere as well.
> It is true. You get 2 copies, one in the journal and it also relays one t=
o=20
> rsyslog. This should fix it:
>
> systemctl mask systemd-journald-audit.socket
>
> -Steve

Gotcha; thanks Steve.
LCB=20

--=20
Lenny Bruzenak
MagitekLTD


--------------68156D995F683801F109B0D7
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>On 11/1/19 9:49 AM, Steve Grubb wrote:<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:786313584.jd3umIO2dN@x2">
      <blockquote type=3D"cite" style=3D"color: #000000;">
        <pre class=3D"moz-quote-pre" wrap=3D"">+1 for me, except I would al=
so question why it would even listen, as to
me it seems that implies storage.

If that's true, I would want to be able to disable it as I do not want
audit events stored elsewhere as well.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">It is true. You get 2 copies, =
one in the journal and it also relays one to=20
rsyslog. This should fix it:

systemctl mask systemd-journald-audit.socket

-Steve
</pre>
    </blockquote>
    <pre class=3D"moz-quote-pre" wrap=3D"">Gotcha; thanks Steve.
LCB=20
</pre>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------68156D995F683801F109B0D7--

--===============0408847708833041239==
Content-Type: text/plain; charset=WINDOWS-1252
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============0408847708833041239==--

