Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BF2BD154B39
	for <lists+linux-audit@lfdr.de>; Thu,  6 Feb 2020 19:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581014029;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kIzUvrWmZP3pS4ORnK0Knzw2P7WepqTxRrfsiF0XaiY=;
	b=PYFXsYyX5SAlotXibBfp5CQP775/2oGSutSTZcgUsDJdSwdg4F8Ld+wgPdxeYYz/F+Ceq7
	a43pekRvlTQ5FJ3VaPQrbNx4dG2w6jDYrzywUFteyCAuI1hh+PCsXcjvZEIOEJCt5OWFWF
	OFynVFo9WoSxlU2P3hxSA63nVKtKB6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-sq-6t0NiP0uER2jw8yMZOA-1; Thu, 06 Feb 2020 13:33:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34C88800EB2;
	Thu,  6 Feb 2020 18:33:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 427C78E9FE;
	Thu,  6 Feb 2020 18:33:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6222E866A8;
	Thu,  6 Feb 2020 18:33:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016IXTsD005249 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 13:33:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D71B110F9A8; Thu,  6 Feb 2020 18:33:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0D4C10F997
	for <linux-audit@redhat.com>; Thu,  6 Feb 2020 18:33:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23472800195
	for <linux-audit@redhat.com>; Thu,  6 Feb 2020 18:33:25 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-232-hYu8kclCMEW7D_wPh7r1DA-1; Thu, 06 Feb 2020 13:33:22 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so343744pjb.0
	for <linux-audit@redhat.com>; Thu, 06 Feb 2020 10:33:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=EqdfP6vY2VgU8wzafDO4apWOA+ZxSLI/q7nQs17Z9i4=;
	b=o/CmaINlwrmy2klhZaV14nWKJlGoVFGCu/FPqj4AYTe38FezH5g5IKoh07Fmc63+YQ
	p5Bxvt6GBuzlMX56fe0tGvDB47eLtLkYGvZhyhqjoRu/5SRSEdPSj2AL6WhNoDXTRicA
	lmWK9Dr0kiR8IeDvZtou91olBKi45m9WTzP6kV74/pAv11YlbKSaphgphKi9pdM3HcRD
	uRY/1HZzzwLKY+vbgbejC0zCiGrZ7XjAuy4xVZmBvEQSY1a9KYRkfQL3YZdx1PFvshXl
	58Yoq8JsC45Hc55rymP2hO4T3ro48NlOQE/w2+q49EPo7QSHlCxvxmRTDFdAcC84yyzb
	d4bg==
X-Gm-Message-State: APjAAAW+/AzlhiyKPLpmDohNelXSwiX2eHWYBd/cihY4myooP3Xg+nyO
	JFFxQLsK1JH8wPc8lZCbG5CElkTcc3w=
X-Google-Smtp-Source: APXvYqxfI8MEs3IXPB/ywN/lLL1oKKnK8pGv/uExZnxcN3RVoc9ukTPthqQKSWkrCH21U87/zCEIaA==
X-Received: by 2002:a17:902:968c:: with SMTP id
	n12mr5402075plp.144.1581014001308; 
	Thu, 06 Feb 2020 10:33:21 -0800 (PST)
Received: from ?IPv6:2607:f768:200:b:ffff:ffff:ffff:fc19?
	([2607:f768:200:b:ffff:ffff:ffff:fc19])
	by smtp.gmail.com with ESMTPSA id p24sm109162pff.69.2020.02.06.10.33.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 06 Feb 2020 10:33:20 -0800 (PST)
Subject: Re: Is auditing ftruncate useful?
To: Orion Poplawski <orion@nwra.com>, linux-audit@redhat.com
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<7f299e8c-6888-91eb-8feb-91e37fb87fd2@magitekltd.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
Date: Thu, 6 Feb 2020 11:33:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
Content-Language: en-US
X-MC-Unique: hYu8kclCMEW7D_wPh7r1DA-1
X-MC-Unique: sq-6t0NiP0uER2jw8yMZOA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 2/6/20 11:12 AM, Orion Poplawski wrote:

> Doesn't seem much better:
>
> type=PROCTITLE msg=audit(02/06/2020 10:58:23.626:119631) : proctitle=/bin/bash
> /usr/bin/thunderbird
> type=SYSCALL msg=audit(02/06/2020 10:58:23.626:119631) : arch=x86_64
> syscall=ftruncate success=yes exit=0 a0=0x4a a1=0x28 a2=0x7f1e41600018
> a3=0xfffffe00 items=0 ppid=2451 pid=3561 auid=USER uid=USER gid=USER euid=USER
> suid=USER fsuid=USER egid=USER sgid=USER fsgid=USER tty=(none) ses=1
> comm=thunderbird exe=/usr/lib64/thunderbird/thunderbird
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=watched_users
>
> Why no PATH entry?  I have them for things like open:


The kernel guys can probably answer this accurately.

My guess is that because with open, the path must be validated, but 
ftruncate works on a file descriptor; maybe gets no path validation.

LCB

-- 
LC Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

