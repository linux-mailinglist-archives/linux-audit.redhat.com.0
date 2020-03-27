Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id D0F26195833
	for <lists+linux-audit@lfdr.de>; Fri, 27 Mar 2020 14:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585316483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I5CihFHsSqmBrguCTsTwHq8exLrNFreXYKI36Nq5yqk=;
	b=VHtJSVYYIegC2m6+Haap9Usr9M5vAnq2VHYBLLkcruFqlF4HLC8/pU+f0ez3d9J/yW7uoe
	eZAvkYMrPL+p5lCm5S8R5L0bA3I9J5rwSWkPMyTmr4NJsxIDpqL15/zvDHBJGKLfshhaye
	cbFcP8zRz5tV6GD4/JBKu9i1My6ejnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-AWisGGlEO3aWOXjyPvYf6A-1; Fri, 27 Mar 2020 09:41:20 -0400
X-MC-Unique: AWisGGlEO3aWOXjyPvYf6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 868BE107ACC7;
	Fri, 27 Mar 2020 13:41:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F725E02A;
	Fri, 27 Mar 2020 13:41:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D32118089C8;
	Fri, 27 Mar 2020 13:41:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RDemZd006110 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 09:40:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FE6C10551A6; Fri, 27 Mar 2020 13:40:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE1B1055194
	for <linux-audit@redhat.com>; Fri, 27 Mar 2020 13:40:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2417B8FF66B
	for <linux-audit@redhat.com>; Fri, 27 Mar 2020 13:40:46 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-W-7opFf-NT6xB7OeQ-h61Q-1; Fri, 27 Mar 2020 09:40:43 -0400
X-MC-Unique: W-7opFf-NT6xB7OeQ-h61Q-1
Received: by mail-ed1-f50.google.com with SMTP id v1so11141668edq.8
	for <linux-audit@redhat.com>; Fri, 27 Mar 2020 06:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m7u0IIxVGRI1FMLqDdAgtDukqCelpTSFp2qsxx7fa8c=;
	b=IepJkm706FBeaKqkt97bHN2aDMq6ZJAU8wioPSvx+CuytiKp6f4DY+52SFaZspuhTO
	9Rk2lqJSGKi1HAol/BG8MdJrgQ2k35TmYcQ+5g3CHjNRn7ljpa+TsnDi3eX+Qg8Uabbs
	QowO8v0mNOUHh+kI9fYUtezMlrB4Rw5rWLBGK67lmjO8I5RhTbqeHmsf9vOr5yibxEJU
	SIF6EJA4TrMZJ916B3oP4ftTSGOeYOOnkxj+4eL03H4vwsvjFRxY78b8pjBRvB1j52K0
	yijzhtDyyHdWoAtM0/OzVs67leJeHmkg7O0OvgS1gj/irY0pbPwyf3Eb4CkMZbwsn+oe
	v3uQ==
X-Gm-Message-State: ANhLgQ3rPxDpYpjh+VBW5E0C+/seaIHBYszzNXawPN9omhewHVW7ZX2X
	PdwcgvjHhbcZYqG0iLHLlxNPvZZLS6bLkwahF3w3
X-Google-Smtp-Source: ADFU+vvJPFoczP3xgQDPBPoQclvMeqOcezALhTyCzCdY1wX9ZVIL34as0lPSahcwxx/Ffgivj6hhN0t/gz6wDnblQdc=
X-Received: by 2002:a17:906:4b52:: with SMTP id
	j18mr12807637ejv.272.1585316441969; 
	Fri, 27 Mar 2020 06:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <5F4EE10832231F4F921A255C1D95429807639D60@DEERLM99EX7MSX.ww931.my-it-solutions.net>
In-Reply-To: <5F4EE10832231F4F921A255C1D95429807639D60@DEERLM99EX7MSX.ww931.my-it-solutions.net>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Mar 2020 09:40:30 -0400
Message-ID: <CAHC9VhT_ihVZkJ2U=2wtnNTPrJ8JQffas59rJ212vtcNCanZ5w@mail.gmail.com>
Subject: Re: Full shell access or sudo command
To: "MAUPERTUIS, PHILIPPE" <philippe.maupertuis@equensworldline.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RDemZd006110
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 27, 2020 at 5:18 AM MAUPERTUIS, PHILIPPE
<philippe.maupertuis@equensworldline.com> wrote:
>
> Hi,
>
> Our sysadmins are able to use sudo to take a root shell and do whatever they want.
>
> On the contrary, application managers for example have only a limited set of sudo scripts and commands
>
> Is it possible to find if a given audit message (for example due to a watch on a file) has been  issued in the context of sudo or a shell?
>
> My goal is to be able  to search for potential sudo abuse through misconfiguration.

I'm sure others will have suggestions, probably better than mine, but
I would think that putting a watch on the sudo binary and paying
careful attention to the login UID ("auid" field) and session ("ses"
field) could be helpful.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

