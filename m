Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5F39F1F03D6
	for <lists+linux-audit@lfdr.de>; Sat,  6 Jun 2020 02:22:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x1RDqCkVlbs1hAgm6/QV+Cx/vsOkKUjAV24LkvJjVHM=;
	b=fAFp3IuxLACxv/d7ADr2xzNDw8k3sxCBaXiivHizUVGor/hedUG0Yj9IQk3gwIFvgA5Cvs
	TA70EDdrKMWAt6+bcgJK0fInAwVihQAWgsEboaVh0+mb3yWrwW9JvUA/xQIGNpFRWjZpTO
	axc/ufJYICmBcbgetHTHr+imEaW2MoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-2PEMOodpMZaQzej7SY7qsA-1; Fri, 05 Jun 2020 20:22:52 -0400
X-MC-Unique: 2PEMOodpMZaQzej7SY7qsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83B7B64A75;
	Sat,  6 Jun 2020 00:22:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A8E610013D5;
	Sat,  6 Jun 2020 00:22:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 025CF180043B;
	Sat,  6 Jun 2020 00:22:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Kns0x008709 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 16:49:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21A516351D; Fri,  5 Jun 2020 20:49:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DF1F6378B
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 20:49:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 270F78007CB
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 20:49:47 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-5-21fi6PH-NkGWdevy6fZv9w-1; Fri, 05 Jun 2020 16:49:44 -0400
X-MC-Unique: 21fi6PH-NkGWdevy6fZv9w-1
Received: by mail-ed1-f66.google.com with SMTP id m32so3294621ede.8
	for <linux-audit@redhat.com>; Fri, 05 Jun 2020 13:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=21Q9/cXvccHpfKM5LJV8/84Rguo7Ngf33rA3ZIRa5vs=;
	b=bsK0bAfn6EVx9RnSRKj3IiqQqL+qoJ+iEIo0pPlkWhvMrOaOtdXoPvAYi2ENiQ3hjm
	IFZXe/Rm9HcJ5jdd/wwiIfmFOMr5xeBJahVuI3uikOb4f8EWWPBvpBb1ckSSrpmnH4KA
	g8C666ttD4JjV/imqU9YxL0rTtfSEobUKV6MSvNTn91SsdF7AfE183L+5zPMzlxjWKej
	GCALH6X0UGmmW1WMkETaoL3QjH4XbPCgsduN+oxaxctp5IN4LThNVbtaLQnVvtsGozuo
	U7azJYxdk2i0hHs++gImsT2VzNkB3wjOLSdyhOLu4VRWh0cQF53p8tKLId7ZaA/WTFbd
	3y0w==
X-Gm-Message-State: AOAM53182X1lCkeKcGLzP6h9p9Su0RExQ6RKvEE8kOg/4WIMNmlIRqHt
	Dz0pSd4VHh1a1FeXo+pdMwOKDeadxumlQ6ywVj+y
X-Google-Smtp-Source: ABdhPJx8T/cpE+4mff+a8QGPcmAGE5mv7vBpaH31a5ydwUTia6v9NmR0TJm+SgSptgqBn0B9v/5hdv8UgtqffyiA2r4=
X-Received: by 2002:a05:6402:1d29:: with SMTP id
	dh9mr10952923edb.269.1591390183122; 
	Fri, 05 Jun 2020 13:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200604163243.2575-1-nramas@linux.microsoft.com>
	<1591382782.5816.36.camel@linux.ibm.com>
	<CAHC9VhS-EP=Kk3GKRzAGAYa5mqupkLQCHz_m_DgoAKRWcSTgLA@mail.gmail.com>
	<8dfb3fa6-5c1f-d644-7d21-72a9448c52cc@linux.microsoft.com>
In-Reply-To: <8dfb3fa6-5c1f-d644-7d21-72a9448c52cc@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 5 Jun 2020 16:49:32 -0400
Message-ID: <CAHC9VhS8gmrWxt75aHAE16PWAay7sUrffZiT0A8VLugwexK4Uw@mail.gmail.com>
Subject: Re: [PATCH] IMA: Add log statements for failure conditions
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>
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

On Fri, Jun 5, 2020 at 3:54 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
> On 6/5/20 12:37 PM, Paul Moore wrote:
>
> > If it's audit related, it's generally best to CC the linux-audit list,
> > not just me (fixed).
> >
> > It's not clear to me what this pr_err() is trying to indicate other
> > than *something* failed.  Can someone provide some more background on
> > this message?
>
> process_buffer_measurement() is currently used to measure
> "kexec command line", "keys", and "blacklist-hash". If there was any
> error in the measurement, this pr_err() will indicate which of the above
> measurement failed and the related error code.
>
> Please let me know if you need more info on this one.

That helps, thank you.

> Since a pr_xyz() call was already present, I just wanted to change the
> log level to keep the code change to the minimum. But if audit log is
> the right approach for this case, I'll update.

Generally we reserve audit for things that are required for various
security certifications and/or "security relevant".  From what you
mentioned above, it seems like this would fall into the second
category if not the first.

Looking at your patch it doesn't look like you are trying to record
anything special so you may be able to use the existing
integrity_audit_msg(...) helper.  Of course then the question comes
down to the audit record type (the audit_msgno argument), the
operation (op), and the comm/cause (cause).

Do you feel that any of the existing audit record types are a good fit for this?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

