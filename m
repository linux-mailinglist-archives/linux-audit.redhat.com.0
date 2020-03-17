Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 382F2188D5F
	for <lists+linux-audit@lfdr.de>; Tue, 17 Mar 2020 19:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584470495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1AKPoePBxGi12U8CxWfbC0hdl9Oy0r5iVXaQFaMCc08=;
	b=ZBdFopx7PP+/d3uIwP5qIBbP3dapgsPMvEDJQ2FCDAh683XYvQ6IdvniPo92duGZITTC6m
	B1kvST/Q9a27Gk6q1t6EMjTyCMiR6xFTDI+sGpkUBSGckmezQ6lV1kil81hoSyAgMW9Px4
	I6PK9gR4abfxOPkGWhe08jbZXQKw2DQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-J9_OjRlMMKK2m45XafWxNQ-1; Tue, 17 Mar 2020 14:41:33 -0400
X-MC-Unique: J9_OjRlMMKK2m45XafWxNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4FFA19057B2;
	Tue, 17 Mar 2020 18:41:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC1CE5C1BB;
	Tue, 17 Mar 2020 18:41:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 587741809567;
	Tue, 17 Mar 2020 18:41:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HIfGqc014304 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 14:41:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 544C960C84; Tue, 17 Mar 2020 18:41:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAA7460BE0;
	Tue, 17 Mar 2020 18:41:08 +0000 (UTC)
Date: Tue, 17 Mar 2020 14:41:03 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: always check the netlink payload length in
	audit_receive_msg()
Message-ID: <20200317184103.7m4scrzuqw5kjlh2@madcap2.tricolour.ca>
References: <158258480936.525901.8492820711796738271.stgit@chester>
	<CAHC9VhRd_QGp4KoOait-=UPtQeDi_vkgT=NrSOK2+tq1z8HTaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRd_QGp4KoOait-=UPtQeDi_vkgT=NrSOK2+tq1z8HTaw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-02-24 17:58, Paul Moore wrote:
> On Mon, Feb 24, 2020 at 5:53 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > This patch ensures that we always check the netlink payload length
> > in audit_receive_msg() before we take any action on the payload
> > itself.
> >
> > Cc: stable@vger.kernel.org
> > Reported-by: syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com
> > Reported-by: syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
> > ---
> >  kernel/audit.c |   43 +++++++++++++++++++++++--------------------
> >  1 file changed, 23 insertions(+), 20 deletions(-)
> 
> ...
> 
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 17b0d523afb3..6e8b176bdb68 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -1334,26 +1339,24 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
> >                                         break;
> >                         }
> >                         audit_log_user_recv_msg(&ab, msg_type);
> > -                       if (msg_type != AUDIT_USER_TTY)
> > +                       if (msg_type != AUDIT_USER_TTY) {
> > +                               /* ensure NULL termination */
> > +                               str[data_len - 1] = '\0';
> >                                 audit_log_format(ab, " msg='%.*s'",
> >                                                  AUDIT_MESSAGE_TEXT_MAX,
> > -                                                (char *)data);
> > -                       else {
> > -                               int size;
> > -
> > +                                                str);
> > +                       } else {
> >                                 audit_log_format(ab, " data=");
> > -                               size = nlmsg_len(nlh);
> > -                               if (size > 0 &&
> > -                                   ((unsigned char *)data)[size - 1] == '\0')
> > -                                       size--;
> > -                               audit_log_n_untrustedstring(ab, data, size);
> > +                               if (data_len > 0 && str[data_len - 1] == '\0')
> > +                                       data_len--;
> > +                               audit_log_n_untrustedstring(ab, data, data_len);
>                                                                   ^^^^
> ... and it looks like I didn't properly refresh my patch before
> sending, the second arg in the line above is "str" not "data".

Ok, better late than never.  This all looks reasonable to me, but I've
not tested it.

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

