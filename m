Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4588E14E774
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 04:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580440728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ewLN26Q0QnPreyeW8mezYMZcpKfJU3RZMB8TJFRnwhg=;
	b=RYCL23GIN1CW+XjOdrPCf2gdxZw/ybQZwdP5GoOfGyEJjK2nKaXH+/hPgKk2tLVPfLt38A
	k38RsHyo4mB3pnt0C8SOX4xfAOVSZHx/WuXFiFoFu9ivx9o1lFwIwpKuDDeJvUgD/8wBZ2
	fM25vM9EZC+k3PfmgUFIBakmZfP64tA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-IxstPMnnMaq-maw5tS02Wg-1; Thu, 30 Jan 2020 22:18:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A52231005512;
	Fri, 31 Jan 2020 03:18:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F3DA5DA7B;
	Fri, 31 Jan 2020 03:18:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3ACE987A96;
	Fri, 31 Jan 2020 03:18:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V3Ibwc019866 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 22:18:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D5C7F2166B2C; Fri, 31 Jan 2020 03:18:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1FB12166B29
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58E8F811D07
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:35 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-281-Wr2TXbRpNTyz2Qf096-R6A-1; Thu, 30 Jan 2020 22:18:33 -0500
Received: by mail-ed1-f68.google.com with SMTP id cy15so6243299edb.4
	for <linux-audit@redhat.com>; Thu, 30 Jan 2020 19:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xEOcbam6lkpewzM/QAeXoI3lqiVgnug3kiCPMonrhtk=;
	b=rDTczEppf0oEwhIyPtSA2GcRh26UyWXkfl5ub8OmHCnQWrDUeeHaBDYYPDb7ymqkyE
	W2m9mk2T8Le4fYxTzzWg05mlta8L21UzVah5w6ftePhr7jmuBLPk0ShEgAobgJANHxxK
	vMzRqK+4nrc6IlRo4z3CzwXZzV5070jrO+M/8mmNNKc/0AOYZ/wDXPu1ExOTfX+CxYFX
	E90Eaef8VTYmWfXVSSOx7ZiT/ckADdACBCw/9BlFxjUj/wFfFzzact7mqbFAAcZ1hof5
	/3482stA9flkLUYuV0+wfS5chhSBUdeQ2V6qUwTpVXX6pf0b2Xwq6pqJz+6qRe5v8V5M
	tfhQ==
X-Gm-Message-State: APjAAAXDfs/g0QHcuKcEBirYL1dPQi3yjGG+gwsZG5qNmf7icc/87AQT
	q4G1E2dBCKhKsKe3ycXLDbqXiwU3WwdeLU/k5qfj
X-Google-Smtp-Source: APXvYqxufqzKyb49egpBrJmvUXyLRz88Mm+V9y+cHsgviO9ZYjgLZ0WhxG3Xh0NApIF+UruakQs1vxR25nSGP/fXa80=
X-Received: by 2002:a17:906:f251:: with SMTP id
	gy17mr6798194ejb.308.1580440712079; 
	Thu, 30 Jan 2020 19:18:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577830902.git.rgb@redhat.com>
	<9f16dee52bac9a3068939283a0122a632ee0438d.1577830902.git.rgb@redhat.com>
In-Reply-To: <9f16dee52bac9a3068939283a0122a632ee0438d.1577830902.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jan 2020 22:18:21 -0500
Message-ID: <CAHC9VhS4Cz1T=hycPVz3aCzOpPX-EDzwh284YQ2V5rUM7BJkzg@mail.gmail.com>
Subject: Re: [PATCH ghak25 v2 7/9] netfilter: ebtables audit table registration
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: Wr2TXbRpNTyz2Qf096-R6A-1
X-MC-Unique: IxstPMnnMaq-maw5tS02Wg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V3Ibwc019866
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2020 at 1:56 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Generate audit NETFILTER_CFG records on ebtables table registration.
>
> Previously this was only being done for all x_tables operations and
> ebtables table replacement.
>
> Call new audit_nf_cfg() to store table parameters for later use with
> syscall records.
>
> Here is a sample accompanied record:
>   type=NETFILTER_CFG msg=audit(1494907217.558:5403): table=filter family=7 entries=0

Wait a minute ... in patch 4 you have code that explicitly checks for
"entries=0" and doesn't generate a record in that case; is the example
a lie or is the code a lie? ;)

> See: https://github.com/linux-audit/audit-kernel/issues/43
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  net/bridge/netfilter/ebtables.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
> index 57dc11c0f349..58126547b175 100644
> --- a/net/bridge/netfilter/ebtables.c
> +++ b/net/bridge/netfilter/ebtables.c
> @@ -1219,6 +1219,8 @@ int ebt_register_table(struct net *net, const struct ebt_table *input_table,
>                 *res = NULL;
>         }
>
> +       if (audit_enabled)
> +               audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
>         return ret;
>  free_unlock:
>         mutex_unlock(&ebt_mutex);
> --
> 1.8.3.1

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

