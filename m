Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 60613146FD7
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 18:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579801017;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mHFayyq9iUTAi+MhLW9El1oIBNicX605KPInokkAtCQ=;
	b=ORMomLErl0QAoeUjPV47G3Y9nQ7ofmwzOjEgq86nT+k2EVUpxajNjVmW311lVzE4dTCHn0
	seTA1kPJ5LRhN3Muqs2ucpybuE8qHcQEf0vVB9Diw8k5XPjiuwlt7IZv8MWvV1UzZMcIXG
	ym3EXDKhWvh7Q5gEGGhiRCkRBLvdots=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-LLKkbK7zNaerOPzdGkNAiQ-1; Thu, 23 Jan 2020 12:09:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70061100550E;
	Thu, 23 Jan 2020 17:09:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB8681001920;
	Thu, 23 Jan 2020 17:09:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB53A8594A;
	Thu, 23 Jan 2020 17:09:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NH9MZC018563 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 12:09:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7DA21113F8B; Thu, 23 Jan 2020 17:09:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79CD7113F8F
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 17:09:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02FEE185A78E
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 17:09:20 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-8YVV6B7AMkaS8dsZjqK6og-1; Thu, 23 Jan 2020 12:09:17 -0500
Received: by mail-lj1-f196.google.com with SMTP id w1so4364669ljh.5
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 09:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EoI0l4kaWTQec4tn5Ld9ZCvI5RqFAqp9PrVGXBLYlGE=;
	b=XkuE2Y/79DPOCCOtbb4KrR3/hyJFIcx/SBiLZT2ZtTsyKPy5jMQWRZD5pHqU405LFl
	L+6trWupxjo4TUDPqZWz6RC9U8VEZ39Ho9OwdNtE/tBAgZSpfMGKwaRkkLmTapPogtNY
	MsX5cSV7WTscF5OmbE0eVkSKCkaLybGcNflv7zioervRhH8flbyJak5X2xHMwk+OUrSq
	nC0tjAgHbtPe2Ba0ebRCK9EnxdaLF7ZxdR99D6cqNFeVshBi6lbL0Tefu/bTe+leaIdK
	3LyXllsK+PGlJAPhBwWal4rVyxYgJjoJfWKs+bOVH0gaH1ZQ+IoVCILjIp1vfchUKFoy
	OHcA==
X-Gm-Message-State: APjAAAVCkhjJGZ3VkTZdJOc/vkbMV7ewJ5K0H88wtw1VTsPpvm2EBONA
	DP6X+0W5VM2O7m8sLsCeARvHMKNs7rkY0MIpGcOU
X-Google-Smtp-Source: APXvYqw/G8F1wO9xDPIULnMv336Q7Ztb/ejMkG/Wfe5XISfozmjQXVeq7xRRyREbIKTpRE6MgbiXKL2eAyaswTaX414=
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr23988656ljk.30.1579799355718; 
	Thu, 23 Jan 2020 09:09:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<7d7933d742fdf4a94c84b791906a450b16f2e81f.1577736799.git.rgb@redhat.com>
	<CAHC9VhSuwJGryfrBfzxG01zwb-O_7dbjS0x0a3w-XjcNuYSAcg@mail.gmail.com>
	<20200123162918.b3jbed7tbvr2sf2p@madcap2.tricolour.ca>
In-Reply-To: <20200123162918.b3jbed7tbvr2sf2p@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 Jan 2020 12:09:04 -0500
Message-ID: <CAHC9VhTusiQoudB8G5jjDFyM9WxBUAjZ6_X35ywJ063Jb75dQA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: 8YVV6B7AMkaS8dsZjqK6og-1
X-MC-Unique: LLKkbK7zNaerOPzdGkNAiQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00NH9MZC018563
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 23, 2020 at 11:29 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-01-22 16:28, Paul Moore wrote:
> > On Tue, Dec 31, 2019 at 2:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > >
> > > Add audit container identifier support to the action of signalling the
> > > audit daemon.
> > >
> > > Since this would need to add an element to the audit_sig_info struct,
> > > a new record type AUDIT_SIGNAL_INFO2 was created with a new
> > > audit_sig_info2 struct.  Corresponding support is required in the
> > > userspace code to reflect the new record request and reply type.
> > > An older userspace won't break since it won't know to request this
> > > record type.
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/audit.h       |  7 +++++++
> > >  include/uapi/linux/audit.h  |  1 +
> > >  kernel/audit.c              | 35 +++++++++++++++++++++++++++++++++++
> > >  kernel/audit.h              |  1 +
> > >  security/selinux/nlmsgtab.c |  1 +
> > >  5 files changed, 45 insertions(+)
> >
> > ...
> >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index 0871c3e5d6df..51159c94041c 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -126,6 +126,14 @@ struct auditd_connection {
> > >  kuid_t         audit_sig_uid = INVALID_UID;
> > >  pid_t          audit_sig_pid = -1;
> > >  u32            audit_sig_sid = 0;
> > > +/* Since the signal information is stored in the record buffer at the
> > > + * time of the signal, but not retrieved until later, there is a chance
> > > + * that the last process in the container could terminate before the
> > > + * signal record is delivered.  In this circumstance, there is a chance
> > > + * the orchestrator could reuse the audit container identifier, causing
> > > + * an overlap of audit records that refer to the same audit container
> > > + * identifier, but a different container instance.  */
> > > +u64            audit_sig_cid = AUDIT_CID_UNSET;
> >
> > I believe we could prevent the case mentioned above by taking an
> > additional reference to the audit container ID object when the signal
> > information is collected, dropping it only after the signal
> > information is collected by userspace or another process signals the
> > audit daemon.  Yes, it would block that audit container ID from being
> > reused immediately, but since we are talking about one number out of
> > 2^64 that seems like a reasonable tradeoff.
>
> I had thought that through and should have been more explicit about that
> situation when I documented it.  We could do that, but then the syscall
> records would be connected with the call from auditd on shutdown to
> request that signal information, rather than the exit of that last
> process that was using that container.  This strikes me as misleading.
> Is that really what we want?

 ???

I think one of us is not understanding the other; maybe it's me, maybe
it's you, maybe it's both of us.

Anyway, here is what I was trying to convey with my original comment
... When we record the audit container ID in audit_signal_info() we
take an extra reference to the audit container ID object so that it
will not disappear (and get reused) until after we respond with an
AUDIT_SIGNAL_INFO2.  In audit_receive_msg() when we do the
AUDIT_SIGNAL_INFO2 processing we drop the extra reference we took in
audit_signal_info().  Unless I'm missing some other change you made,
this *shouldn't* affect the syscall records, all it does is preserve
the audit container ID object in the kernel's ACID store so it doesn't
get reused.

(We do need to do some extra housekeeping in audit_signal_info() to
deal with the case where nobody asks for AUDIT_SIGNAL_INFO2 -
basically if audit_sig_cid is not NULL we should drop a reference
before assigning it a new object pointer, and of course we would need
to set audit_sig_cid to NULL in audit_receive_msg() after sending it
up to userspace and dropping the extra ref.)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

