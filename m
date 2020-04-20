Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 12C351B1A2C
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 01:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587425407;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ivQJC+3UbI/V7kPtORiLtOwjJCOkyhfudqz4CtZEL5Q=;
	b=CheHyOmUyNyP3iZC8K1c6uGOYUDKRb3VXW/G4kxRh6uO37xMeBQeInuFT+FzQCAdXnDr0r
	v51bUAiV664yqqBfPJyGQjmWFv/2ad7zF0nPZvSvKlR9pUxkGeLsl1E4etEW4z26nPBKZd
	vHkT5ztWVG+JX2YtUXaT8vfQgpCClpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-9EZSbQEMMqSVs2xHgswVkQ-1; Mon, 20 Apr 2020 19:30:03 -0400
X-MC-Unique: 9EZSbQEMMqSVs2xHgswVkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97463107ACCA;
	Mon, 20 Apr 2020 23:29:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 034FF18A85;
	Mon, 20 Apr 2020 23:29:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20E0D180880B;
	Mon, 20 Apr 2020 23:29:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KNTaQc003660 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 19:29:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 564442166B28; Mon, 20 Apr 2020 23:29:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 525B22166B27
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 23:29:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D15A8FF67A
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 23:29:34 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-_ZMTVBzvN42zf04OIEp-kA-1; Mon, 20 Apr 2020 19:29:31 -0400
X-MC-Unique: _ZMTVBzvN42zf04OIEp-kA-1
Received: by mail-ed1-f66.google.com with SMTP id d16so8834647edq.7
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 16:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=so/doF79VuspGhKpCCq9PIxX8VUrizbwW51E/bwYhKQ=;
	b=cJ6mFUhP24ShuRIfFSMxepR2LwvSzPYN24V4cHz0TQhge0INogcHGtvN/lXfuo6cVQ
	5E40HcHo+Bf6/QWbfx7QSdGlSMyQXHmp639gKX52M+p3a/WXewetNS6A0LmPPymnhQub
	HX1rhSSoDzN8yGRygkd4ld9i8aVPK2NRfEUcu3rl7H6dXBG3gUHfOfTHIqFkRjUVRGbF
	r6aJAIx2+ioDrkk2jae7vt9BT8ydeSvW02SBHfphFVZyypt3dOfbhgs9Ak+YOa64qu9B
	m5nRZXFQBFPy2USWXZJHd9RBeraqCOkIG/y8Xjm8DSu2FWPPhNA/cmucD7hxGqLfX1Q3
	EoRw==
X-Gm-Message-State: AGi0PuanuC8NklcuKXg62OlEIzP8myzwlUDzGlWw2j4K5s1AXROIKZV3
	74MID5l6fHLHrBWxF6X2n9NXOOmCpGnNtWbNvRNO4OE=
X-Google-Smtp-Source: APiQypKWHgACtzJ5o4BxcV7HzIpHBaeaMqxc5fPPu4mWjXZoP0f5+slLxJ5BFaQOjUew6S0+H9lm4FqL4FHlYEg7RMg=
X-Received: by 2002:aa7:cd59:: with SMTP id v25mr4115174edw.135.1587425369986; 
	Mon, 20 Apr 2020 16:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <158741856073.246860.5955712228915579.stgit@chester>
	<20200420215615.chh4c5ytxumadtt7@madcap2.tricolour.ca>
In-Reply-To: <20200420215615.chh4c5ytxumadtt7@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Apr 2020 19:29:18 -0400
Message-ID: <CAHC9VhSypHKGHeVVLF+fVEFkVmDCP0uCZ0s1FXRPzvnsr73sZQ@mail.gmail.com>
Subject: Re: [PATCH] audit: check the length of userspace generated audit
	records
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KNTaQc003660
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 20, 2020 at 5:56 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-20 17:36, Paul Moore wrote:
> > Commit 756125289285 ("audit: always check the netlink payload length
> > in audit_receive_msg()") fixed a number of missing message length
> > checks, but forgot to check the length of userspace generated audit
> > records.  The good news is that you need CAP_AUDIT_WRITE to submit
> > userspace audit records, which is generally only given to trusted
> > processes, so the impact should be limited.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 756125289285 ("audit: always check the netlink payload length in audit_receive_msg()")
> > Reported-by: syzbot+49e69b4d71a420ceda3e@syzkaller.appspotmail.com
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
> > ---
> >  kernel/audit.c |    3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index b69c8b460341..87f31bf1f0a0 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -1326,6 +1326,9 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
> >       case AUDIT_FIRST_USER_MSG2 ... AUDIT_LAST_USER_MSG2:
> >               if (!audit_enabled && msg_type != AUDIT_USER_AVC)
> >                       return 0;
> > +             /* exit early if there isn't at least one character to print */
> > +             if (data_len < 2)
> > +                     return -EINVAL;
>
> Don't we want to issue the record even if the message is empty?  If a
> len of 1 is passed in, it will properly set str[0] = '\0' and str points
> to a location with a null that prints nothing between the single quotes
> of "msg=''".  So, I think that should be "if (data_len < 1)".
>
> Am I missing something?

I've got no problem with allowing an empty message so long as there is
a valid use for such a message.  Can anyone think of a valid reason
for having an empty userspace generated record?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

