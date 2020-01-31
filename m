Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 13C6214E776
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 04:19:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580440743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mK6I1VUtmmfLThDBc5L+N4s787/jt8pt5GLsR3W4iMU=;
	b=jCyPiQyV/0PwJDVob0L3jEeE6JpZbs3crqtzSXyWBGfixBGzuEfO3cULH8ltkb3GlbgNB1
	JlhmCauPimxjcqZ8wqs6a1ngVSc2npgZRjhEAIBWHXOS2xqnE8Fc6sVDfu/9r78V3SfyHG
	HxqzLVAtu02TDstrPqYu30VN2csm94g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-ohOBQ0hRO5aiCUmWlWj5sw-1; Thu, 30 Jan 2020 22:19:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0469801E77;
	Fri, 31 Jan 2020 03:18:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD2A98889D;
	Fri, 31 Jan 2020 03:18:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83ED187A97;
	Fri, 31 Jan 2020 03:18:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V3Ine0019886 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 22:18:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7AC192033955; Fri, 31 Jan 2020 03:18:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75CF92093CE3
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72ED2805A71
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:47 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-34-NQvHh8QLPF67gPZgj59aBg-1; Thu, 30 Jan 2020 22:18:42 -0500
Received: by mail-ed1-f67.google.com with SMTP id j17so6246076edp.3
	for <linux-audit@redhat.com>; Thu, 30 Jan 2020 19:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LKOQDwQXUKurXAuWrVOtd5P3N/wFMue6QikAKX3EcpA=;
	b=SHJPmYunsIXctAtdWsX/ERadynOW6CN4aRrxCPfm/mv95kgS+DIril4ua+YBa9Pqr0
	c8RROiQ/+NBJ4UdZk/cadbL7louO7w7sSfcylDnTipz00bm1EwH9JTZh2lfoJW3wXhAw
	BLOrSRS1UsiyRqpQ3m0xP7unjUEwMcIcNGel/0v/ILmRjZUqe5E9CcsSjxvtNF5Fnrh9
	hAYpdRo1wWjfIqz4ODiwwW71ukMhlp9BLVSkIdMj69SIBEc9TY4B8UP3XVbsJ4KZjHmq
	xOtVlyQ/DWlvspAHELOviuKX4Vsrf4bqXsSel9niBfBxN0jo1+gDXSgxVFEo1s8M9tXM
	J1BA==
X-Gm-Message-State: APjAAAWNbq/BlqIeK8qrL/0bAPENIGmXPSGrMyA4lgSTnir+1mLy+Fkf
	aj1n1CaJE+ovkCz9i0IcVq0J1lK48aO5zvwLyrsS
X-Google-Smtp-Source: APXvYqw09MWPYLMr7f3uRk+GZfakkhXc+lJFBHeovGHAdcIoR1uSTt46Qff+xrB69Kx1ppYEa5zmxK0semOUo0AFq+k=
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr6582030edr.164.1580440721231; 
	Thu, 30 Jan 2020 19:18:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577830902.git.rgb@redhat.com>
	<6768f7c7d9804216853e6e9c59e44f8a10f46b99.1577830902.git.rgb@redhat.com>
	<20200106202306.GO795@breakpoint.cc>
In-Reply-To: <20200106202306.GO795@breakpoint.cc>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jan 2020 22:18:29 -0500
Message-ID: <CAHC9VhSuX-f8c-yoph4UB=sHXVuuDLPzRWs19=OVrY+9TBRjkg@mail.gmail.com>
Subject: Re: [PATCH ghak25 v2 8/9] netfilter: add audit operation field
To: Florian Westphal <fw@strlen.de>
X-MC-Unique: NQvHh8QLPF67gPZgj59aBg-1
X-MC-Unique: ohOBQ0hRO5aiCUmWlWj5sw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V3Ine0019886
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2020 at 3:23 PM Florian Westphal <fw@strlen.de> wrote:
> Richard Guy Briggs <rgb@redhat.com> wrote:
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 96cabb095eed..5eab4d898c26 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -379,7 +379,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
> >  extern void __audit_fanotify(unsigned int response);
> >  extern void __audit_tk_injoffset(struct timespec64 offset);
> >  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> > -extern void __audit_nf_cfg(const char *name, u8 af, int nentries);
> > +extern void __audit_nf_cfg(const char *name, u8 af, int nentries, int op);
>
> Consider adding an enum instead of int op.
>
> >       if (audit_enabled)
> > -             audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
> > +             audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries, 1);
>
> audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries, AUDIT_XT_OP_REPLACE);
>
> ... would be a bit more readable than '1'.
>
> The name is just an example, you can pick something else.

I agree.  Also, please just merge this into patch 4; I don't see a
solid reason why it shouldn't be there.

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

