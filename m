Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF7B2D1BCA
	for <lists+linux-audit@lfdr.de>; Mon,  7 Dec 2020 22:15:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-iTAh_Hg3MSS026Lg3xqELg-1; Mon, 07 Dec 2020 16:15:28 -0500
X-MC-Unique: iTAh_Hg3MSS026Lg3xqELg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC382CE646;
	Mon,  7 Dec 2020 21:15:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB8960BD8;
	Mon,  7 Dec 2020 21:15:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B477A180954D;
	Mon,  7 Dec 2020 21:15:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7LFHVe024583 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 16:15:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 694742026D38; Mon,  7 Dec 2020 21:15:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6416C2026D36
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:15:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0899A858287
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 21:15:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
	[209.85.218.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-568-RGjbzs7RN0WZVKCpV352Tg-1; Mon, 07 Dec 2020 16:15:12 -0500
X-MC-Unique: RGjbzs7RN0WZVKCpV352Tg-1
Received: by mail-ej1-f47.google.com with SMTP id jx16so21545325ejb.10
	for <linux-audit@redhat.com>; Mon, 07 Dec 2020 13:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vmEOfFns1yqv1TtYRBE/bQPDxEtG3oyaA5JHmAOMzeA=;
	b=mLer6yKsCN+/nePX3ggEC/+k8DsHECdf2W6UdZstQMvqXprQrd+CGBEOXPHhD9ygLt
	OH0K9SN6gx9YXffX3arnayxKsj8TKg5fFMGGtW2rzGRGiG/7ZuprjJz3UkVV6W+nrYkJ
	Wwixq988XoKR+wGnxZtbW1G1sxuDn2w6otbcfgHtwN8DE5v62Lr2hAGfvbMVJVxt7ah7
	qjTdcGZgh5AhmLlFy3JMsdmschoeNK0xQIVLVrfcMNwouJ6Sb3ICOyn9YYtW5OQciAZy
	bKBGVT8lda6ABonES9BdszquCbTcCRJf7jVDMxcsPIKP65XFQpFI7Qhru9N2O1H03Iaq
	UKVw==
X-Gm-Message-State: AOAM532pKUGS8QtyzaK+GS4YBW3c/EmtqESTBvcWnNOpVGMWWZVXWEFU
	ucgZysE+TTJaOkzNwvpqZAbkk9WJ136O8bcmbRNgGQu7YXqx
X-Google-Smtp-Source: ABdhPJw7EL1VDbYppqoWwVRZGnFFJQfHnlUfrsAjIR3sovO0pdHPucJde7p9MARkQdc5ScaQsuCkrnbejTOhe4sox8A=
X-Received: by 2002:a17:906:c096:: with SMTP id
	f22mr20155406ejz.488.1607375710747; 
	Mon, 07 Dec 2020 13:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
	<3fb7e274-c442-8025-ba27-bc27f445640a@magitekltd.com>
In-Reply-To: <3fb7e274-c442-8025-ba27-bc27f445640a@magitekltd.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 7 Dec 2020 16:14:59 -0500
Message-ID: <CAHC9VhQDU+kjje92woXwB6yJ3WgEs4s-sZTi0WBgLEeq4+Mftg@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Lenny Bruzenak <lenny@magitekltd.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B7LFHVe024583
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 7, 2020 at 2:43 PM Lenny Bruzenak <lenny@magitekltd.com> wrote:
> Paul,
>
> This change does seem to the untrained eye to be in line with the existing FEATURE_BITMAP definitions. I appreciate your intent on not exhausting the available space, but at some point if that happens is there any reasonable way to expand? I'm sure you have some thoughts, or is this "it" as far as features could go (the last available bits)?

I haven't given it a lot of thought, but I'm sure there are ways we
could expand the bitmap if/when it is needed.  I'm also sure it would
be ugly; it almost always is a pain.

My hope is that we've changed the API before then so it is a non-issue.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

