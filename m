Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 411731560ED
	for <lists+linux-audit@lfdr.de>; Fri,  7 Feb 2020 22:56:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581112604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GA5pRKnHqpL//OLDudSejj5hiQpDQOv99uKQRLdb9qQ=;
	b=U8DfVgB+/qk0OMyZL+AV55R2Oj7SmzXLiHkfhsB3uMg7M7KdXu/mAAOdmKUdBsa/QbvIz6
	DYM8s6MrsdPjnG7SsIvksCjS4v54ldvZV/SAJz7AUOFqZy9HfY2r6+QeTlV0snwUmCyeSZ
	ZB3OD2NuTwkNxRN32djXPfvbaxpBOfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-1C7tj9PrN7eP3WQXkBA0gA-1; Fri, 07 Feb 2020 16:56:41 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1413D800D5C;
	Fri,  7 Feb 2020 21:56:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 680371001B30;
	Fri,  7 Feb 2020 21:56:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E9261809567;
	Fri,  7 Feb 2020 21:56:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017LuCIC023756 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 16:56:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F191D117C29; Fri,  7 Feb 2020 21:56:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED2B5117C1F
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 21:56:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 285DA18E05EC
	for <linux-audit@redhat.com>; Fri,  7 Feb 2020 21:56:09 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
	[209.85.221.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-6MqR8OtLNuS9dtYOD5_ioQ-1; Fri, 07 Feb 2020 16:56:07 -0500
Received: by mail-vk1-f180.google.com with SMTP id w67so244816vkf.1
	for <linux-audit@redhat.com>; Fri, 07 Feb 2020 13:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-transfer-encoding;
	bh=/KcNnsjA3helEGwvXqOTHKLh1uy3mI1cCqsFGzSdCsM=;
	b=C9Ck414AlwVCm0G/oPh+sd6RcJS86/TlgDNskVG3Fw6A03NVGDB56luAAM8ndWYqpC
	OORJF8L6l5xotrm68+3DKlYpy3LLR6FUBotkf8SCpHrgRq33ezceRAKh8xMbjJXgd8Yl
	4vtMRUKYWOsDrWo+ZpL5EkK/5iBSqqoIIdEBMT+DCI5zTA22/3/tKrlmjItw1kW1Ueaq
	+4PNJKo4f7kt4Z8EktLKU+8J5VLgVgQmF+qkvyTEBjgI5cg84ByGbqYLlH/7jZl/N7Vz
	dcpvnaRCY5+zeZzzCaRRQs2EcjQSRGOkuPUmEBi7nsRD0emY3pPsOecBqZix6C5b2WmJ
	hNNw==
X-Gm-Message-State: APjAAAW8kZ1bqFEKZggspFskWTz+fZDxJ5CG/Q6xC8xJ+LusRFjBBrOo
	v0SlMe8zK8l08/XmPX7T8/+otrXclPBg
X-Google-Smtp-Source: APXvYqyYdh2kofLPUd/O33VHO4Sk+rAnHB4CYdZkDpwoPXAo3ELPRu3jhQTru968bzXU9bL+UW3pWw==
X-Received: by 2002:a1f:d583:: with SMTP id m125mr824100vkg.17.1581112566161; 
	Fri, 07 Feb 2020 13:56:06 -0800 (PST)
Received: from [10.200.44.117] ([108.60.230.202])
	by smtp.gmail.com with ESMTPSA id
	h187sm1521528vkb.40.2020.02.07.13.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Feb 2020 13:56:05 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: Steve Grubb <sgrubb@redhat.com>, <linux-audit@redhat.com>
Date: Fri, 07 Feb 2020 16:56:04 -0500
Message-ID: <17021a5a608.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <1758232.KkKbY19U6n@x2>
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
	<1758232.KkKbY19U6n@x2>
User-Agent: AquaMail/1.23.0-1554 (build: 102300001)
Subject: Re: Is auditing ftruncate useful?
MIME-Version: 1.0
X-MC-Unique: 6MqR8OtLNuS9dtYOD5_ioQ-1
X-MC-Unique: 1C7tj9PrN7eP3WQXkBA0gA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017LuCIC023756
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On February 7, 2020 2:18:33 PM Steve Grubb <sgrubb@redhat.com> wrote:
> On Thursday, February 6, 2020 1:33:19 PM EST Lenny Bruzenak wrote:
>>> Doesn't seem much better:
>>>
>>> type=PROCTITLE msg=audit(02/06/2020 10:58:23.626:119631) :
>>> proctitle=/bin/bash /usr/bin/thunderbird
>>> type=SYSCALL msg=audit(02/06/2020 10:58:23.626:119631) : arch=x86_64
>>> syscall=ftruncate success=yes exit=0 a0=0x4a a1=0x28 a2=0x7f1e41600018
>>> a3=0xfffffe00 items=0 ppid=2451 pid=3561 auid=USER uid=USER gid=USER
>>> euid=USER suid=USER fsuid=USER egid=USER sgid=USER fsgid=USER tty=(none)
>>> ses=1 comm=thunderbird exe=/usr/lib64/thunderbird/thunderbird
>>> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
>>> key=watched_users
>>> Why no PATH entry?  I have them for things like open:
>>
>> The kernel guys can probably answer this accurately.
>
> I would have thought that they would have chimed in by now. Since they didn't
> you might want to file an issue on github. I think you found a problem that
> someone should look into some day.

One of them (me) is on vacation, and only dealing with emergencies as they arise - this isn't one of those.  I'm not sure what Richard is doing, but you'll get an answer when I'm back in "the office" if Richard doesn't comment first.

That said, it's always okay to file a GH issue.

--
paul moore
www.paul-moore.com




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

