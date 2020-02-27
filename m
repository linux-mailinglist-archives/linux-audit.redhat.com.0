Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B710817251B
	for <lists+linux-audit@lfdr.de>; Thu, 27 Feb 2020 18:31:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582824663;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=ViUAZkfAqCNKfU9Pr69Xgvi4B4h+pFpNPsFHCOcs4GE=;
	b=eLiXgPIsz3zXwSRWAN+1hqdR/mUuxETIvN/ptZPYzZmsA/aom63vuCp11klGl7fLLFYkqw
	3rxw8oYWUfPwUnWAFfKdn7NAi1SjtMQj0vFN84eI+td5pCSCibnAiFg5NZmbA6bw3kqV/w
	a8htERToBE1vqloCgMFiYNdfO888+1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-z1d5A1VBPryaZ_4Yv5fHBg-1; Thu, 27 Feb 2020 12:31:00 -0500
X-MC-Unique: z1d5A1VBPryaZ_4Yv5fHBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66651107B76B;
	Thu, 27 Feb 2020 17:30:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB3492984;
	Thu, 27 Feb 2020 17:30:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98FCD84468;
	Thu, 27 Feb 2020 17:30:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01RHTg3H019054 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 12:29:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C67372166B2F; Thu, 27 Feb 2020 17:29:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6443E2166B2C
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 17:29:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45CCC8007AC
	for <linux-audit@redhat.com>; Thu, 27 Feb 2020 17:29:40 +0000 (UTC)
Received: from sonic309-27.consmr.mail.ne1.yahoo.com
	(sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-487-Bq2wnsLxNgC62cl_wnlYig-1;
	Thu, 27 Feb 2020 12:29:37 -0500
X-MC-Unique: Bq2wnsLxNgC62cl_wnlYig-1
X-YMail-OSG: 1AU2mbsVM1kqVdksyReZD6pe58jfC3d5U5QvWSg8.kUcXELhfRqDIz1diKiFByg
	0N3QtLPTyFamV7ckZVZFNTC56hWo6v6tST9DRGyzFJcuO7demPMyT8KFwNPB2usmuOcrDg1byJvc
	UDcVY9NOgp_9AyYYKz1iKncrdfhIIjynYRHsAPacr.tdmSZlGp0obiQFI__1lke.m5SwdMhrccl3
	Bic0sdAHy6k1lEl6laAcDiPm28Q_gXitc7n2U.VFLd7K9pkzMBOvthAW2v8peNZI1LdBj3bMVS2I
	8zyJsjYufTlMQmkDc0z8BebF4THxwkJoHelts6bjvySIjhHQE3BKNbwVnEv9SjojUsC6yIIKOGDX
	t2rn.LolstC8JRz24wucDF5UZYiX3zYZjrge0hP3u57F7FyTkzDFqN0XG50huLynvhu.fLFx3hSJ
	mWorsN8e2SQSIorZLBgSM7Vrc20UKITKsA8fuwWvp5n0I7gqkLPKQJm8a5Veyvna6M6H4bmeWS0I
	.81KPqFFcGp5ykE5tVDZROz2cXvxhDVAohwMyB8vASQjVF1NcMz2USIqv07o43_AOo0.nhgjEdQG
	zeovRteRpqjzDPIv1b4k.L0pedFVZYgfxGZfrLOtYHplxToXURLx0gGn7cwlrC6sWkEIPeGmXbZP
	qGMV.N2bhrWjgVhEbrM0GtmE9PLw98.mYccKENmJ0LeoLvjSGs4DofITSUSrN71prcvLmZ0WzSYu
	1TH_dF3N_SlMYl7VphLpJ9bliMo3wS6RkNoWtQ9yVPL.mzqWqk0505xeCSOa.MnVPfuGv_llZsba
	h7hNSKyaa2NCCMd0F5bcUZ2cnwhPLC6_I4UZ8lC2kRgoBthGsUhHte.Ibn9vlc5L5xwlHmjHb724
	CXea3X08ROaKORBH0ItgPi85u5QqlSuHw5GT29cikqsE5pmcq16uylp.v5Dg8FxCkEQTL1k6QnZG
	0ieUPoUuIOJVVVhNs4yMAjfgbcdffIUjmoQAmY9oYjxNrLtjsuMJ3C.c5yzBKBiaiz..yon1USvH
	7OXxOZThX.mP9lw6_iSxyADazHcDfA7Ff3_bto.ulsH2sAwv_Y45JaVJPG3iUgnD06PniTenEh94
	Q5Nk4DQTjBMs2tP6YZMOarkFOSC91sPRDmJh2grHGBFYNWgah1BMMmaesLxutzCIO_5gy3saCS4p
	Qn1qperYXBbNovSZ38N0GPgcrMhJzKq7yASQG_3qo9l3aUkDJ6GOJxnRfix2b_FatDPSH_cT9lYN
	fytqH92.pU.EjR6lY4oumYbNTnGxwH5hQyxp._vriJYPvKNsBe9Vn3fk8TC9pbtbv4tZIRegs4XE
	hTqMxRzaH6LDdZMaeq_BKdR5ecu6Z26tFLxrgQfKmk3B0ZkHLc8cRJMMcAj11vVtvA8cFH4XpzdE
	kjwaPq9ugq2hx54VhhA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 27 Feb 2020 17:29:36 +0000
Received: by smtp403.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID cfb9d626a1e7425746376d4d1c3a348a; 
	Thu, 27 Feb 2020 17:29:35 +0000 (UTC)
Subject: Re: [PATCH v15 00/23] LSM: Module stacking for AppArmor
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey.schaufler@intel.com, linux-audit@redhat.com
References: <20200222000407.110158-1-casey.ref@schaufler-ca.com>
	<20200222000407.110158-1-casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <853ac380-2132-febe-fda0-ff0a0a74d480@schaufler-ca.com>
Date: Thu, 27 Feb 2020 09:29:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200222000407.110158-1-casey@schaufler-ca.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01RHTg3H019054
X-loop: linux-audit@redhat.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMi8yMS8yMDIwIDQ6MDMgUE0sIENhc2V5IFNjaGF1ZmxlciB3cm90ZToKPiBSZXNlbmRpbmcg
dGhlIGF1ZGl0IHJlbGF0ZWQgcGF0Y2hlcyB0byB0aGUgYXVkaXQgbGlzdCwKPiBhcyB0aGVyZSBo
YXZlIGJlZW4gcHJvYmxlbXMgd2l0aCB0aGUgQ0MgbGlzdHMuCgpUaGVyZSdzIGFuIGF3ZnVsIGxv
dCBvZiBpbnRlcmFjdGlvbiBiZXR3ZWVuIHRoZSBtb2R1bGUgc3RhY2tpbmcKYW5kIHRoZSBhdWRp
dCBzdWItc3lzdGVtLiBJIGhhdmUgbm90IGdvdHRlbiBtdWNoIGZlZWRiYWNrIGFib3V0CnRoZSBh
dWRpdCBjaGFuZ2VzIHJlY2VudGx5LCBidXQgSSBjYW4ndCBicmluZyBteXNlbGYgdG8gdGhpbmsK
dGhpcyBtZWFucyB0aGVyZSBhcmVuJ3QgYW55IGNvbmNlcm5zLiBCZWZvcmUgSSBzdGFydCBwdXNo
aW5nIGZvcgp0aGUgc3RhY2tpbmcgdG8gZ2V0IHB1bGxlZCBJIHdvdWxkIHJlYWxseSBhcHByZWNp
YXRlIGVpdGhlciBBQ0tzCm9yIG1lYW5pbmdmdWwgY29tbWVudHMgZnJvbSB0aGUgYXVkaXQgY29t
bXVuaXR5LiBJIGNhbiBzZWUgdGhhdAp0aGVyZSdzIGEgbG90IGdvaW5nIG9uIGluIHRoZSBhdWRp
dCBzdWItc3lzdGVtLCBhbmQgYXBwcmVjaWF0ZQp0aGF0IHByaW9yaXRpZXMgbWF5IGJlIGVsc2V3
aGVyZS4KClRoYW5rIHlvdS4KwqAKCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4
LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWF1ZGl0

