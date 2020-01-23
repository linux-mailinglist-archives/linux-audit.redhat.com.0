Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EC41C146E7D
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 17:30:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579797004;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=USrI8NnpUhfu21BLu0+3bFCPrGCH5I7cgwAg9XAS3aQ=;
	b=Xgs/Xw+p6P/Cb5Zz7xvpih8YVcnrFccetcyiIaiF3lIhDD7lm4xYAJMleexYXJ6+8pbGzU
	LehhxgrCIK1BZxtu5RPKZDmz4nkrD/mKf981PNrZ3SruroGqoMZrYHKixhZ2y/h1P3rClA
	YNq0Oveb9ZrPZwqGrM5g/zYA+httZaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333--hutop91M0qQJhgvSuBHLQ-1; Thu, 23 Jan 2020 11:29:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDA3918C35BC;
	Thu, 23 Jan 2020 16:29:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D757D60BF3;
	Thu, 23 Jan 2020 16:29:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22F4C85941;
	Thu, 23 Jan 2020 16:29:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NGTgjK015313 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 11:29:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA3325E252; Thu, 23 Jan 2020 16:29:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6D95DA60;
	Thu, 23 Jan 2020 16:29:20 +0000 (UTC)
Date: Thu, 23 Jan 2020 11:29:18 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
Message-ID: <20200123162918.b3jbed7tbvr2sf2p@madcap2.tricolour.ca>
References: <cover.1577736799.git.rgb@redhat.com>
	<7d7933d742fdf4a94c84b791906a450b16f2e81f.1577736799.git.rgb@redhat.com>
	<CAHC9VhSuwJGryfrBfzxG01zwb-O_7dbjS0x0a3w-XjcNuYSAcg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSuwJGryfrBfzxG01zwb-O_7dbjS0x0a3w-XjcNuYSAcg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: -hutop91M0qQJhgvSuBHLQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-22 16:28, Paul Moore wrote:
> On Tue, Dec 31, 2019 at 2:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Add audit container identifier support to the action of signalling the
> > audit daemon.
> >
> > Since this would need to add an element to the audit_sig_info struct,
> > a new record type AUDIT_SIGNAL_INFO2 was created with a new
> > audit_sig_info2 struct.  Corresponding support is required in the
> > userspace code to reflect the new record request and reply type.
> > An older userspace won't break since it won't know to request this
> > record type.
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  include/linux/audit.h       |  7 +++++++
> >  include/uapi/linux/audit.h  |  1 +
> >  kernel/audit.c              | 35 +++++++++++++++++++++++++++++++++++
> >  kernel/audit.h              |  1 +
> >  security/selinux/nlmsgtab.c |  1 +
> >  5 files changed, 45 insertions(+)
> 
> ...
> 
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 0871c3e5d6df..51159c94041c 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -126,6 +126,14 @@ struct auditd_connection {
> >  kuid_t         audit_sig_uid = INVALID_UID;
> >  pid_t          audit_sig_pid = -1;
> >  u32            audit_sig_sid = 0;
> > +/* Since the signal information is stored in the record buffer at the
> > + * time of the signal, but not retrieved until later, there is a chance
> > + * that the last process in the container could terminate before the
> > + * signal record is delivered.  In this circumstance, there is a chance
> > + * the orchestrator could reuse the audit container identifier, causing
> > + * an overlap of audit records that refer to the same audit container
> > + * identifier, but a different container instance.  */
> > +u64            audit_sig_cid = AUDIT_CID_UNSET;
> 
> I believe we could prevent the case mentioned above by taking an
> additional reference to the audit container ID object when the signal
> information is collected, dropping it only after the signal
> information is collected by userspace or another process signals the
> audit daemon.  Yes, it would block that audit container ID from being
> reused immediately, but since we are talking about one number out of
> 2^64 that seems like a reasonable tradeoff.

I had thought that through and should have been more explicit about that
situation when I documented it.  We could do that, but then the syscall
records would be connected with the call from auditd on shutdown to
request that signal information, rather than the exit of that last
process that was using that container.  This strikes me as misleading.
Is that really what we want?

> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

