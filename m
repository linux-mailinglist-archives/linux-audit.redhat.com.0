Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E59690AC9
	for <lists+linux-audit@lfdr.de>; Thu,  9 Feb 2023 14:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675950409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b2P6sizVVlgrHcgXQr/jbOpcWjiSFDCzi+9oaSe97xY=;
	b=eT61QwFQWqGEZRLf3KD0uG6K0mXVnn7AqIviXm3Au0dt42Nw4r+NAG7PBxoHjVKvsu7TQ4
	0Z9dkcL9+Ugwtd8o7oVrwEjQYgNOIBC64fkCBDjEwLN3LCAwmD9XJ3dWlnKsCOMX2uztOS
	vtyX8vV6ThYSHykYBoTZtWOHiqO85KQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-qIVU946UOwCe6XRphMUB9g-1; Thu, 09 Feb 2023 08:46:46 -0500
X-MC-Unique: qIVU946UOwCe6XRphMUB9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EEAF802C1D;
	Thu,  9 Feb 2023 13:46:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77D2D440D9;
	Thu,  9 Feb 2023 13:46:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BB55C19465B3;
	Thu,  9 Feb 2023 13:46:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 21B421946589 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Feb 2023 09:07:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D6FBD2026D68; Thu,  9 Feb 2023 09:07:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE9E02026D4B
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 09:07:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A75D03C14868
 for <linux-audit@redhat.com>; Thu,  9 Feb 2023 09:07:56 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-581-yrnAIY6SOZSpEt-9kvgrYw-1; Thu,
 09 Feb 2023 04:07:53 -0500
X-MC-Unique: yrnAIY6SOZSpEt-9kvgrYw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C27C5C53E;
 Thu,  9 Feb 2023 09:07:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CBA61339E;
 Thu,  9 Feb 2023 09:07:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id niyuEue35GP+IgAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 09 Feb 2023 09:07:51 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id CA87BA06D8; Thu,  9 Feb 2023 10:07:50 +0100 (CET)
Date: Thu, 9 Feb 2023 10:07:50 +0100
From: Jan Kara <jack@suse.cz>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v7 0/3] fanotify: Allow user space to pass back
 additional audit info
Message-ID: <20230209090750.lx32p57jtul7pnv5@quack3>
References: <cover.1675373475.git.rgb@redhat.com>
 <20230207120921.7pgh6uxs7ze7hkjo@quack3>
 <CAHC9VhQuD0UMYd12x9kOMwruDmQsyUFxQ8gJ3Q_qF6a58Lu+2Q@mail.gmail.com>
 <20230208120816.2qhck3sb7u67vsib@quack3>
 <CAHC9VhSumNxmoYQ9JPtBgV0dc1fgR38Lqbo0w4PRxhvBdS=W_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSumNxmoYQ9JPtBgV0dc1fgR38Lqbo0w4PRxhvBdS=W_w@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Thu, 09 Feb 2023 13:46:37 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed 08-02-23 10:03:24, Paul Moore wrote:
> On Wed, Feb 8, 2023 at 7:08 AM Jan Kara <jack@suse.cz> wrote:
> > On Tue 07-02-23 09:54:11, Paul Moore wrote:
> > > On Tue, Feb 7, 2023 at 7:09 AM Jan Kara <jack@suse.cz> wrote:
> > > > On Fri 03-02-23 16:35:13, Richard Guy Briggs wrote:
> > > > > The Fanotify API can be used for access control by requesting permission
> > > > > event notification. The user space tooling that uses it may have a
> > > > > complicated policy that inherently contains additional context for the
> > > > > decision. If this information were available in the audit trail, policy
> > > > > writers can close the loop on debugging policy. Also, if this additional
> > > > > information were available, it would enable the creation of tools that
> > > > > can suggest changes to the policy similar to how audit2allow can help
> > > > > refine labeled security.
> > > > >
> > > > > This patchset defines a new flag (FAN_INFO) and new extensions that
> > > > > define additional information which are appended after the response
> > > > > structure returned from user space on a permission event.  The appended
> > > > > information is organized with headers containing a type and size that
> > > > > can be delegated to interested subsystems.  One new information type is
> > > > > defined to audit the triggering rule number.
> > > > >
> > > > > A newer kernel will work with an older userspace and an older kernel
> > > > > will behave as expected and reject a newer userspace, leaving it up to
> > > > > the newer userspace to test appropriately and adapt as necessary.  This
> > > > > is done by providing a a fully-formed FAN_INFO extension but setting the
> > > > > fd to FAN_NOFD.  On a capable kernel, it will succeed but issue no audit
> > > > > record, whereas on an older kernel it will fail.
> > > > >
> > > > > The audit function was updated to log the additional information in the
> > > > > AUDIT_FANOTIFY record. The following are examples of the new record
> > > > > format:
> > > > >   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
> > > > >   type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=0 subj_trust=2 obj_trust=2
> > > >
> > > > Thanks! I've applied this series to my tree.
> > >
> > > While I think this version of the patchset is fine, for future
> > > reference it would have been nice if you had waited for my ACK on
> > > patch 3/3; while Steve maintains his userspace tools, I'm the one
> > > responsible for maintaining the Linux Kernel's audit subsystem.
> >
> > Aha, I'm sorry for that. I had the impression that on the last version of
> > the series you've said you don't see anything for which the series should
> > be respun so once Steve's objections where addressed and you were silent
> > for a few days, I thought you consider the thing settled... My bad.
> 
> That's understandable, especially given inconsistencies across
> subsystems.  If it helps, if I'm going to ACK something I make it
> explicit with a proper 'Acked-by: ...' line in my reply; if I say
> something looks good but there is no explicit ACK, there is usually
> something outstanding that needs to be resolved, e.g. questions,
> additional testing, etc.

Ok, thanks for letting me now. Next time I'll wait for an explicit ack from
you. This time, since everybody is fine with the actual patch, let's just
move on ;).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

