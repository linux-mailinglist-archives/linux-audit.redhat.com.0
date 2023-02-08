Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8B68EFE6
	for <lists+linux-audit@lfdr.de>; Wed,  8 Feb 2023 14:36:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675863388;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EVziu//1uUHVNN2M2m8nmH477D+Ir1XVkam4j4qDzjE=;
	b=BFEKhlUkbH4YIHuL82Rh5ZMdG8M+SJb9NrGfvI6UHAVohAvx2jvurC2+etzu8Ae1o1KrMi
	r8+PCnxsRGFhBn8STX50Y8G7nAAvHWFWfxoabj6Bwx6fp8CDwbGx5q/E0KaK8hJrFWar78
	+acu1F+bh8WJHzyi+30DPAmk5qu/Be8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-eGEeZohJO1OQMMbcMZZZZw-1; Wed, 08 Feb 2023 08:36:26 -0500
X-MC-Unique: eGEeZohJO1OQMMbcMZZZZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AC031C05EAF;
	Wed,  8 Feb 2023 13:36:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61930C15BA0;
	Wed,  8 Feb 2023 13:36:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3424019465A8;
	Wed,  8 Feb 2023 13:36:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D6B441946589 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Feb 2023 12:08:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C70542166B2A; Wed,  8 Feb 2023 12:08:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C09512166B29
 for <linux-audit@redhat.com>; Wed,  8 Feb 2023 12:08:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A21DB3810B13
 for <linux-audit@redhat.com>; Wed,  8 Feb 2023 12:08:21 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-182--jsfsbFnNbeGYjsZK1znCQ-1; Wed,
 08 Feb 2023 07:08:18 -0500
X-MC-Unique: -jsfsbFnNbeGYjsZK1znCQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F279343C8;
 Wed,  8 Feb 2023 12:08:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F9DC1358A;
 Wed,  8 Feb 2023 12:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EMX9IrCQ42O5YQAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 08 Feb 2023 12:08:16 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 20E7FA06D5; Wed,  8 Feb 2023 13:08:16 +0100 (CET)
Date: Wed, 8 Feb 2023 13:08:16 +0100
From: Jan Kara <jack@suse.cz>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v7 0/3] fanotify: Allow user space to pass back
 additional audit info
Message-ID: <20230208120816.2qhck3sb7u67vsib@quack3>
References: <cover.1675373475.git.rgb@redhat.com>
 <20230207120921.7pgh6uxs7ze7hkjo@quack3>
 <CAHC9VhQuD0UMYd12x9kOMwruDmQsyUFxQ8gJ3Q_qF6a58Lu+2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQuD0UMYd12x9kOMwruDmQsyUFxQ8gJ3Q_qF6a58Lu+2Q@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 08 Feb 2023 13:36:13 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, Richard Guy Briggs <rgb@redhat.com>,
 linux-api@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue 07-02-23 09:54:11, Paul Moore wrote:
> On Tue, Feb 7, 2023 at 7:09 AM Jan Kara <jack@suse.cz> wrote:
> > On Fri 03-02-23 16:35:13, Richard Guy Briggs wrote:
> > > The Fanotify API can be used for access control by requesting permission
> > > event notification. The user space tooling that uses it may have a
> > > complicated policy that inherently contains additional context for the
> > > decision. If this information were available in the audit trail, policy
> > > writers can close the loop on debugging policy. Also, if this additional
> > > information were available, it would enable the creation of tools that
> > > can suggest changes to the policy similar to how audit2allow can help
> > > refine labeled security.
> > >
> > > This patchset defines a new flag (FAN_INFO) and new extensions that
> > > define additional information which are appended after the response
> > > structure returned from user space on a permission event.  The appended
> > > information is organized with headers containing a type and size that
> > > can be delegated to interested subsystems.  One new information type is
> > > defined to audit the triggering rule number.
> > >
> > > A newer kernel will work with an older userspace and an older kernel
> > > will behave as expected and reject a newer userspace, leaving it up to
> > > the newer userspace to test appropriately and adapt as necessary.  This
> > > is done by providing a a fully-formed FAN_INFO extension but setting the
> > > fd to FAN_NOFD.  On a capable kernel, it will succeed but issue no audit
> > > record, whereas on an older kernel it will fail.
> > >
> > > The audit function was updated to log the additional information in the
> > > AUDIT_FANOTIFY record. The following are examples of the new record
> > > format:
> > >   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
> > >   type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=0 subj_trust=2 obj_trust=2
> >
> > Thanks! I've applied this series to my tree.
> 
> While I think this version of the patchset is fine, for future
> reference it would have been nice if you had waited for my ACK on
> patch 3/3; while Steve maintains his userspace tools, I'm the one
> responsible for maintaining the Linux Kernel's audit subsystem.

Aha, I'm sorry for that. I had the impression that on the last version of
the series you've said you don't see anything for which the series should
be respun so once Steve's objections where addressed and you were silent
for a few days, I thought you consider the thing settled... My bad.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

