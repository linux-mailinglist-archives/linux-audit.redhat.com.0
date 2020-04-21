Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6761B1A9A
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 02:18:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587428316;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MU5xgoiQABGpWc1/3Qim8DCPbSvnhygnFzkE1RdxDcc=;
	b=D/10NiY0VVngqNDK7tRoLYOesTcJiN5T0CWhoHYurluVfrYfHGUI+PDktvu41aH5xhEHbY
	Raj0IQBAnlFxv5c5KCTAO2ZeCnfOinEoFhyiV6MzzLK9RZAKK82kSNCPTsEz6yVdtdrLYM
	42Ozlg2cuk+qX987zyzhtNcOL/0NlWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-baDBBhZEPpCQ2hR90CNkFw-1; Mon, 20 Apr 2020 20:18:34 -0400
X-MC-Unique: baDBBhZEPpCQ2hR90CNkFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C088185388F;
	Tue, 21 Apr 2020 00:18:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1846560C80;
	Tue, 21 Apr 2020 00:18:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32A5493902;
	Tue, 21 Apr 2020 00:18:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03L0IG1i007199 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 20:18:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C46B76E66; Tue, 21 Apr 2020 00:18:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA2EA76E76;
	Tue, 21 Apr 2020 00:18:08 +0000 (UTC)
Date: Mon, 20 Apr 2020 20:18:06 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Lenny Bruzenak <lenny@magitekltd.com>
Subject: Re: [PATCH] audit: check the length of userspace generated audit
	records
Message-ID: <20200421001805.imgllrwuir7i4ry7@madcap2.tricolour.ca>
References: <158741856073.246860.5955712228915579.stgit@chester>
	<20200420215615.chh4c5ytxumadtt7@madcap2.tricolour.ca>
	<CAHC9VhSypHKGHeVVLF+fVEFkVmDCP0uCZ0s1FXRPzvnsr73sZQ@mail.gmail.com>
	<728a2bfa-a5f2-4178-49f1-405adef62ee4@magitekltd.com>
MIME-Version: 1.0
In-Reply-To: <728a2bfa-a5f2-4178-49f1-405adef62ee4@magitekltd.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-20 17:56, Lenny Bruzenak wrote:
> On 4/20/20 5:29 PM, Paul Moore wrote:
> 
> > On Mon, Apr 20, 2020 at 5:56 PM Richard Guy Briggs<rgb@redhat.com>  wrote:
> > > On 2020-04-20 17:36, Paul Moore wrote:
> > > > Commit 756125289285 ("audit: always check the netlink payload length
> > > > in audit_receive_msg()") fixed a number of missing message length
> > > > checks, but forgot to check the length of userspace generated audit
> > > > records.  The good news is that you need CAP_AUDIT_WRITE to submit
> > > > userspace audit records, which is generally only given to trusted
> > > > processes, so the impact should be limited.
> > > > 
> > > > Cc:stable@vger.kernel.org
> > > > Fixes: 756125289285 ("audit: always check the netlink payload length in audit_receive_msg()")
> > > > Reported-by:syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com
> > > > Signed-off-by: Paul Moore<paul@paul-moore.com>
> > > > ---
> > > >   kernel/audit.c |    3 +++
> > > >   1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > index b69c8b460341..87f31bf1f0a0 100644
> > > > --- a/kernel/audit.c
> > > > +++ b/kernel/audit.c
> > > > @@ -1326,6 +1326,9 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
> > > >        case AUDIT_FIRST_USER_MSG2 ... AUDIT_LAST_USER_MSG2:
> > > >                if (!audit_enabled && msg_type != AUDIT_USER_AVC)
> > > >                        return 0;
> > > > +             /* exit early if there isn't at least one character to print */
> > > > +             if (data_len < 2)
> > > > +                     return -EINVAL;
> > > Don't we want to issue the record even if the message is empty?  If a
> > > len of 1 is passed in, it will properly set str[0] = '\0' and str points
> > > to a location with a null that prints nothing between the single quotes
> > > of "msg=''".  So, I think that should be "if (data_len < 1)".
> > > 
> > > Am I missing something?
> > I've got no problem with allowing an empty message so long as there is
> > a valid use for such a message.  Can anyone think of a valid reason
> > for having an empty userspace generated record?
> 
> Not really. Using the libaudit interface(s), even if an empty message string
> is sent, and handled in the lib call(s), I believe it will have minimum
> contextual info, e.g. "exe=... hostname=... ", etc.
> 
> I can't think of a valid reason myself, assuming IIUC.

But even with an empty message, there is still pid, uid, auid, ses, subj
added by the kernel with its own message type.  I could see a valid type
of user message created that has no need for any of those fields added
by audit_log_user_message(), calling audit_send_user_message() directly
(but mind you, it appears to be deprecated to call it directly).

> LCB

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

