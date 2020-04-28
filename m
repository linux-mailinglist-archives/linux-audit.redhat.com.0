Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C032A1BCFA1
	for <lists+linux-audit@lfdr.de>; Wed, 29 Apr 2020 00:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588112185;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KOBOxXqk9nx0ieivF4SuBghxp+ydhlbpkHr6KWJHAv0=;
	b=hUtbJp01BcwEZrfvNUyLmr9b3xOuY6lGYvsz5f9mn2QWy7foAYsAQ+Nmzr0eHav2zZApTg
	PyDVe1nKbovQbwJ3mjjEc97vdjQjArU3Um1KQ6mqYaOeakSq38DCqtwXoZKVerwR1TnOZJ
	sJmbXdKtxydSgJAkwBbLNP/eAPsCo0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Wh_ToNFgO2GDV2P2DOR0jw-1; Tue, 28 Apr 2020 18:16:22 -0400
X-MC-Unique: Wh_ToNFgO2GDV2P2DOR0jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3B6D1895A2B;
	Tue, 28 Apr 2020 22:16:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B3095D715;
	Tue, 28 Apr 2020 22:16:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D03A14CA94;
	Tue, 28 Apr 2020 22:16:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SMG9QU022726 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 18:16:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F98B2157F23; Tue, 28 Apr 2020 22:16:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BD222166B28
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 22:16:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A767B101A526
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 22:16:06 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-57-8STXioJwMdia498QiAvqQA-1; Tue, 28 Apr 2020 18:16:04 -0400
X-MC-Unique: 8STXioJwMdia498QiAvqQA-1
Received: by mail-ej1-f67.google.com with SMTP id e2so145488eje.13
	for <linux-audit@redhat.com>; Tue, 28 Apr 2020 15:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PnnqL1409FTplYbdxZXMGWIU/LS1S0bA0+MaHJS3rik=;
	b=Expp8ZsYbuAc1Sqy+0DLBHwKiWbqZvp6ovYmo0Q38oOBgsZemK0o0SeuAUpJLG63X4
	bnuhnz5db6TfpqYHjjJRsAIJuizHasYgpKGSGFDt//KrIRNYOnaYM87zeW0iE1dUTMJ5
	WMPH+DDiWBZ9Wh87aIs4xEmbK0CENnwEcpRmQxKQ3AWxTLJRfQEy3njjsRblnDaJusBI
	zkJUhQ0y+Hx2YlALzd2+ZNIP6EwcgsttXs/fpMYYfRSxK2ht5BJmTs9wT3BChjnxCJDo
	isc1OguQFs2kTSR7U1NwlSu+2f9sUrf8H2TpffrHUL1SPK1V2wWqNSghyGBn1bD655rx
	H/mQ==
X-Gm-Message-State: AGi0PuZ6wiA7yllAfVAGjJyjhuDAiG4sJuKtj2r4vznZpTP0oJC/I6Fk
	3gYA2dxWFC3Jy0XbPhzWFydz3hNLCSjDm9d54Vif
X-Google-Smtp-Source: APiQypKYPfWFJVQAq/qz8yuzktFBrdOoFdA8P09VBub3DtaP5z/FDVGTygaTpOb+BmDJjKEvjz4La4ZvC8rdqOKMOwI=
X-Received: by 2002:a17:906:29c4:: with SMTP id
	y4mr26782535eje.95.1588112163155; 
	Tue, 28 Apr 2020 15:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587500467.git.rgb@redhat.com>
	<e75f9c91a251278979182f0181d3595d3bb3b2b8.1587500467.git.rgb@redhat.com>
In-Reply-To: <e75f9c91a251278979182f0181d3595d3bb3b2b8.1587500467.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Apr 2020 18:15:52 -0400
Message-ID: <CAHC9VhTfJ0u_wtRpGhBWd3YyE4nZwv4VmPC_oeZbMAZ9qi4bkg@mail.gmail.com>
Subject: Re: [PATCH ghak25 v4 2/3] netfilter: add audit table unregister
	actions
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03SMG9QU022726
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 22, 2020 at 5:40 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Audit the action of unregistering ebtables and x_tables.
>
> See: https://github.com/linux-audit/audit-kernel/issues/44
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h           | 1 +
>  kernel/auditsc.c                | 5 +++--
>  net/bridge/netfilter/ebtables.c | 2 ++
>  net/netfilter/x_tables.c        | 2 ++
>  4 files changed, 8 insertions(+), 2 deletions(-)

Merged into audit/next, thanks.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

