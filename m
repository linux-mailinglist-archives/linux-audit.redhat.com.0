Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C7DFF131A1B
	for <lists+linux-audit@lfdr.de>; Mon,  6 Jan 2020 22:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578345105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XRF6fzKCgy0inNkYKXh1yAJqiGBsYVyX8Tdtd5EMAac=;
	b=DCsReEq5pF1j8PwcGIzammw0GxkhG/J8qz1x94XAagghETY90n1Lto4Furn/SzHHiliBl6
	0GnYGqdPd9AMbfrJ3R0el6BHToafB67lqf3VeVlFkzugyguAj4cyC40JEiFOq1Ntl0cE5o
	avni9NfyKF3CrQLFs1KS8DuldGVo+mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-5lvjGsQNPKW583rLXCNqlQ-1; Mon, 06 Jan 2020 16:11:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D4701883521;
	Mon,  6 Jan 2020 21:11:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A99DB85882;
	Mon,  6 Jan 2020 21:11:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B82418095FF;
	Mon,  6 Jan 2020 21:11:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006KNGee032688 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 15:23:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E6F742022EAC; Mon,  6 Jan 2020 20:23:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E23592022EAB
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 20:23:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A30C4101D222
	for <linux-audit@redhat.com>; Mon,  6 Jan 2020 20:23:13 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-49--pXd9wtwOTCzvVxMaxZNHg-1; Mon, 06 Jan 2020 15:23:11 -0500
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1ioYu2-0006hD-1J; Mon, 06 Jan 2020 21:23:06 +0100
Date: Mon, 6 Jan 2020 21:23:06 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v2 8/9] netfilter: add audit operation field
Message-ID: <20200106202306.GO795@breakpoint.cc>
References: <cover.1577830902.git.rgb@redhat.com>
	<6768f7c7d9804216853e6e9c59e44f8a10f46b99.1577830902.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6768f7c7d9804216853e6e9c59e44f8a10f46b99.1577830902.git.rgb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: -pXd9wtwOTCzvVxMaxZNHg-1
X-MC-Unique: 5lvjGsQNPKW583rLXCNqlQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 006KNGee032688
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 06 Jan 2020 16:11:25 -0500
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard Guy Briggs <rgb@redhat.com> wrote:
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 96cabb095eed..5eab4d898c26 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -379,7 +379,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
>  extern void __audit_fanotify(unsigned int response);
>  extern void __audit_tk_injoffset(struct timespec64 offset);
>  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> -extern void __audit_nf_cfg(const char *name, u8 af, int nentries);
> +extern void __audit_nf_cfg(const char *name, u8 af, int nentries, int op);

Consider adding an enum instead of int op.

>  	if (audit_enabled)
> -		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
> +		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries, 1);

audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries, AUDIT_XT_OP_REPLACE);

... would be a bit more readable than '1'.

The name is just an example, you can pick something else.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

