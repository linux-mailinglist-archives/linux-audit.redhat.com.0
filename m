Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 46410147337
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 22:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579815402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WuV8lKrUvkrYyjv5T6XGg3gm/vtrOKikmhmgrq9Umj4=;
	b=SDW4Xye1Hj5V9e8PqkxSAZ24au8nGEiec1WlsaGDdcpNNGfWTQRvubePho4FTPHnrXubr3
	O1kg47gD26ztLNwWkkcwZq9YFVmXUY3qkSMHIYAQCbAheAsRdH/4JsG3U5JUNbVNAlkJ/T
	+wFpT63JWLq6eGqn51wDkkz8faJDK8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-yqmtM8nZN1qSoM2lMAbvpg-1; Thu, 23 Jan 2020 16:36:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B01DB60;
	Thu, 23 Jan 2020 21:36:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF82B19756;
	Thu, 23 Jan 2020 21:36:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12F4385952;
	Thu, 23 Jan 2020 21:36:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NLaEvC003106 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 16:36:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9F4D02093CEC; Thu, 23 Jan 2020 21:36:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A87A2026D67
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 21:36:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF4778047AA
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 21:36:12 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-364-I8A9t9r-OEGVP4WJdM6ccQ-1; Thu, 23 Jan 2020 16:36:08 -0500
Received: by mail-lj1-f196.google.com with SMTP id v17so226113ljg.4
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 13:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hMyXK37D1SY1vwV+WlcNr41eq9aZRtXuphVComfAQVQ=;
	b=lruNvmM0tl7teYjaZWlnz39iDnXFiW9n8jv+SFldxF5paK4u53RA6loPRdZbC66E4b
	G7V5Zs2J5sR5VB8TR2ZxH6tAt3su5UdLh5Dy4LecqRJD5DSGBVSl8OivuWRq2ilbC1IA
	vRVfUCoXD8GsqfQhhXw2WZKSP6V8IBZb6KKNUHrNYwL3KH7xxV7pkpwJR5ckMRN+qSAc
	WlgGIxCoNpUYz2TpyMcvi9VxRrVn5PSHpzLV6D5DwOHApuCxcfJ4+t0vH1/Kt8LbNtl9
	8fIor2aS/s3bIQKGXBadhbHYzolqei9w51DA/a7xSobFv61O3VmAhJNFduCDrSCDNHgo
	UInQ==
X-Gm-Message-State: APjAAAU3/nuD8Gy7/vtl45e2ikLLAukkpbdjWMFZQ9JBenFJpR97L0ru
	iXfBMerp0e15qFadiTWt87ILG4ud1eBx86bl/FV+
X-Google-Smtp-Source: APXvYqzmiH85n1JcJPF1cLLPQxAHGXAPgPHI716hr05qfSBXxCFeGrnpxFyI4zZk9EfGn+ZIo3+k+WaGSr/n41CSiEg=
X-Received: by 2002:a2e:b52b:: with SMTP id z11mr236562ljm.155.1579815366587; 
	Thu, 23 Jan 2020 13:36:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<7d7933d742fdf4a94c84b791906a450b16f2e81f.1577736799.git.rgb@redhat.com>
	<CAHC9VhSuwJGryfrBfzxG01zwb-O_7dbjS0x0a3w-XjcNuYSAcg@mail.gmail.com>
	<20200123162918.b3jbed7tbvr2sf2p@madcap2.tricolour.ca>
	<CAHC9VhTusiQoudB8G5jjDFyM9WxBUAjZ6_X35ywJ063Jb75dQA@mail.gmail.com>
	<20200123200412.j2aucdp3cvk57prw@madcap2.tricolour.ca>
In-Reply-To: <20200123200412.j2aucdp3cvk57prw@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 Jan 2020 16:35:55 -0500
Message-ID: <CAHC9VhQ2_MQdGAT6Pda9FRe6s0y4JC1XUQenpr-VJiyq9M_CBw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: I8A9t9r-OEGVP4WJdM6ccQ-1
X-MC-Unique: yqmtM8nZN1qSoM2lMAbvpg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00NLaEvC003106
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 23, 2020 at 3:04 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-01-23 12:09, Paul Moore wrote:
> > On Thu, Jan 23, 2020 at 11:29 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-01-22 16:28, Paul Moore wrote:
> > > > On Tue, Dec 31, 2019 at 2:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > >
> > > > > Add audit container identifier support to the action of signalling the
> > > > > audit daemon.
> > > > >
> > > > > Since this would need to add an element to the audit_sig_info struct,
> > > > > a new record type AUDIT_SIGNAL_INFO2 was created with a new
> > > > > audit_sig_info2 struct.  Corresponding support is required in the
> > > > > userspace code to reflect the new record request and reply type.
> > > > > An older userspace won't break since it won't know to request this
> > > > > record type.
> > > > >
> > > > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > > > ---
> > > > >  include/linux/audit.h       |  7 +++++++
> > > > >  include/uapi/linux/audit.h  |  1 +
> > > > >  kernel/audit.c              | 35 +++++++++++++++++++++++++++++++++++
> > > > >  kernel/audit.h              |  1 +
> > > > >  security/selinux/nlmsgtab.c |  1 +
> > > > >  5 files changed, 45 insertions(+)
> > > >
> > > > ...
> > > >
> > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > index 0871c3e5d6df..51159c94041c 100644
> > > > > --- a/kernel/audit.c
> > > > > +++ b/kernel/audit.c
> > > > > @@ -126,6 +126,14 @@ struct auditd_connection {
> > > > >  kuid_t         audit_sig_uid = INVALID_UID;
> > > > >  pid_t          audit_sig_pid = -1;
> > > > >  u32            audit_sig_sid = 0;
> > > > > +/* Since the signal information is stored in the record buffer at the
> > > > > + * time of the signal, but not retrieved until later, there is a chance
> > > > > + * that the last process in the container could terminate before the
> > > > > + * signal record is delivered.  In this circumstance, there is a chance
> > > > > + * the orchestrator could reuse the audit container identifier, causing
> > > > > + * an overlap of audit records that refer to the same audit container
> > > > > + * identifier, but a different container instance.  */
> > > > > +u64            audit_sig_cid = AUDIT_CID_UNSET;
> > > >
> > > > I believe we could prevent the case mentioned above by taking an
> > > > additional reference to the audit container ID object when the signal
> > > > information is collected, dropping it only after the signal
> > > > information is collected by userspace or another process signals the
> > > > audit daemon.  Yes, it would block that audit container ID from being
> > > > reused immediately, but since we are talking about one number out of
> > > > 2^64 that seems like a reasonable tradeoff.
> > >
> > > I had thought that through and should have been more explicit about that
> > > situation when I documented it.  We could do that, but then the syscall
> > > records would be connected with the call from auditd on shutdown to
> > > request that signal information, rather than the exit of that last
> > > process that was using that container.  This strikes me as misleading.
> > > Is that really what we want?
> >
> >  ???
> >
> > I think one of us is not understanding the other; maybe it's me, maybe
> > it's you, maybe it's both of us.
> >
> > Anyway, here is what I was trying to convey with my original comment
> > ... When we record the audit container ID in audit_signal_info() we
> > take an extra reference to the audit container ID object so that it
> > will not disappear (and get reused) until after we respond with an
> > AUDIT_SIGNAL_INFO2.  In audit_receive_msg() when we do the
> > AUDIT_SIGNAL_INFO2 processing we drop the extra reference we took in
> > audit_signal_info().  Unless I'm missing some other change you made,
> > this *shouldn't* affect the syscall records, all it does is preserve
> > the audit container ID object in the kernel's ACID store so it doesn't
> > get reused.
>
> This is exactly what I had understood.  I hadn't considered the extra
> details below in detail due to my original syscall concern, but they
> make sense.
>
> The syscall I refer to is the one connected with the drop of the
> audit container identifier by the last process that was in that
> container in patch 5/16.  The production of this record is contingent on
> the last ref in a contobj being dropped.  So if it is due to that ref
> being maintained by audit_signal_info() until the AUDIT_SIGNAL_INFO2
> record it fetched, then it will appear that the fetch action closed the
> container rather than the last process in the container to exit.
>
> Does this make sense?

More so than your original reply, at least to me anyway.

It makes sense that the audit container ID wouldn't be marked as
"dead" since it would still be very much alive and available for use
by the orchestrator, the question is if that is desirable or not.  I
think the answer to this comes down the preserving the correctness of
the audit log.

If the audit container ID reported by AUDIT_SIGNAL_INFO2 has been
reused then I think there is a legitimate concern that the audit log
is not correct, and could be misleading.  If we solve that by grabbing
an extra reference, then there could also be some confusion as
userspace considers a container to be "dead" while the audit container
ID still exists in the kernel, and the kernel generated audit
container ID death record will not be generated until much later (and
possibly be associated with a different event, but that could be
solved by unassociating the container death record).  Of the two
approaches, I think the latter is safer in that it preserves the
correctness of the audit log, even though it could result in a delay
of the container death record.

Neither way is perfect, so if you have any other ideas I'm all ears.

> > (We do need to do some extra housekeeping in audit_signal_info() to
> > deal with the case where nobody asks for AUDIT_SIGNAL_INFO2 -
> > basically if audit_sig_cid is not NULL we should drop a reference
> > before assigning it a new object pointer, and of course we would need
> > to set audit_sig_cid to NULL in audit_receive_msg() after sending it
> > up to userspace and dropping the extra ref.)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

