Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D15260BFBF
	for <lists+linux-audit@lfdr.de>; Tue, 25 Oct 2022 02:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666658444;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j2ltLevnK5UUwo29tkRFpxfK9umiwzgfTfIhIav+epg=;
	b=FltiwF0N7lwKUkcpRyQ5zV3vICPYTtbk8iqj19OEZGnYPUPrbNiqdUgvhahjr0wjjqG/UJ
	klUxzDTXw5T4wtqzXly/vXIbrvVyMN96ScXJs91g31+rZdnqDMgfOWXlnXX8V/Hdiwzffk
	/Ibz67ue1y/QQ744KurBTfM4CBn4nbY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-HoAjnEZNNfC24xG1-Ppp9g-1; Mon, 24 Oct 2022 20:40:40 -0400
X-MC-Unique: HoAjnEZNNfC24xG1-Ppp9g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC4782999B2C;
	Tue, 25 Oct 2022 00:40:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1938C1121333;
	Tue, 25 Oct 2022 00:40:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EB6FD1946A6D;
	Tue, 25 Oct 2022 00:40:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 455DA1946597 for <linux-audit@listman.corp.redhat.com>;
 Tue, 25 Oct 2022 00:40:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 42B1740C94CF; Tue, 25 Oct 2022 00:40:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A80440C94CE
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 00:40:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D55A101A58E
 for <linux-audit@redhat.com>; Tue, 25 Oct 2022 00:40:10 +0000 (UTC)
Received: from sonic316-27.consmr.mail.ne1.yahoo.com
 (sonic316-27.consmr.mail.ne1.yahoo.com [66.163.187.153]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-157-AiM9z4OsOKWCZR49E8-Nzg-1; Mon,
 24 Oct 2022 20:40:07 -0400
X-MC-Unique: AiM9z4OsOKWCZR49E8-Nzg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666658407; bh=JrU+BnWiZ28uB+unR6ZRW48D5mOckorUyzO5tO11ttA=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=Zn45U0FzfedqRmPsmDHUAYsbZgGW8FcN1uhQoQFZ8f3wD8kK7ap2xbNGKd0+PXFxl8UVGQ8Wtu4LCm0p6WRtqkjYojPD7xqVi5lgqjm+kYCsA5k5RLLPPhBhKBNATFm87TvosScxafna7OncYKEnVVPtrsxn7WCi7FFLRe0MQv+1+c7XSASUoqNkR7ut04TdX/NPE7C3EAmtqv/hLmGytU70xQ44dCbCNUte0N4vsrD3yN0WrNeehEfY59QJouqVX7SxUdtioJExFdK7Or8YL8kOuxQAcdohbdTYbWmMU5LUcultL0oeWuLP7RzbHSjXnd8vUb+TQ9c5Rk5OAZoaFQ==
X-YMail-OSG: Kjjy7r4VM1maFf0iCEa_zYJ6SU8lmQB2ezcC8XHTAu_WFK8ttSwXYa9EHv4Qgtl
 XySWlaXfog6NzkBNv2N4SP3Zl1bKz9Qfjae4FD8aOwCBlseoc1XI7mKrkU6hXeiyqvrlA5MAfA9M
 .knDKVONEqASJq63aFvENgk2OzxUoO9rjwbcP7dct3EYjkEu4_adSiAUWTPBEksqcjEujDp9IkKR
 FJFMUFtICuXCotwL1n3h35f0suV4A.Dnbms_P1pU6rpMRDf7cBDZCLnW4MkarXX306lIjpCxni1l
 d4tTMMAYiYV1bNm5v5e.qCMW4V_SMsOfFhxdPmu.sFukxmGWnAdEGLQBeMdo4f6WzoSrcUzgzCuR
 lRdxyvDFdq4fvLAGVHcQfbJ05FQS5x4Ry8tUbzOGKVUC7jTPvXHfBVTrVPblM4RQCG7X12r.PqWH
 BE.AzFNrIm2X40MgudKSFLRfGEiHAjS8UnpqhlqHY1yenmuZxCMjQNByD97t7guIAWxzypUJ5Cl1
 Ry2jpLSBDIApELhSsZBSLBS74jxSTyAafT5L_sbDRzWp0VHkVxWVinX8oEucUxCmzR2d5K8FYQlV
 fMnrZzB1qdAGBFKlNtXe0nsqhVwOAKqA_ZdPMlR7wvQgrVrxJX4APJrIlDyZOgVDAoE2g.loySaW
 fgKyRKmZXa8PqIcO76acICVziTMSycJ5txugNJAe3957o3GvxJTK3FMU_2fi5sCZCOmENhhdqxKV
 dEKW9pPvoidIOa1Apm24P6Zp6YQJC4rZRGCWz3hnskJ2TMxtunYDjzc5btN8wwdIEEXOo2fe75UR
 .puGW2LkFYBQkSLRHFwOtespLRoirUWdOa4cUoYadfGyWl83kBnZFsdhTxo1waWnwqrvfxFlVag0
 RR.bHuakzWtz8kTqJmbQ8QwL7TcV2fSSNW8LSNgd.jhCQuaatm.O4hNyIX4kZkbdHZECsMggjanz
 0EctXJAbGTgzWDjLq3NvY1dzOmCo_4Gm66CP_mGP8UzDlwkLtsX14PnjvLBV11NHg257Rw5vn5wp
 GXa4BMhnIxwsYZVfP1_4.gR8Sg39U4piUj0I.5IhpVT2E7HP4_qGFWAoX3k43t1Irbh.Bm3lm1Sa
 Eqcox9dkiLCWeE4vNM6AKwEIDLf8juJBUN4iLrIIZQr.6PSz09r0UxDfzi9wH5HdQnDFxihudOu3
 fVsiqqx9dBa2Al1ddjMu7bLtI4PuSrTw0zshYmYNnMf_BIRtD6DfSP5ybSKQk_X4MozzZeTEkhFa
 igRkhjUR0LbRNc1DhOj.0L42EpveW0QtRttgIIKd9fEP19A7R7CnrYr0fRAAkaFegi7zSUjhiHEa
 R4BM8GEbA8y8GWmaKUIDi7DTTkYYm4y.8HHbDtVBdQpKjAefCsMQEY1xJ_nY8l39nMUQQGjSXfCH
 jjeZm2byrDsbuHiTCKOO4dHna81h38za0syC.QnJWMf1SFG.JLKgdDh4F8QTTAbzf601UUxdueak
 AVa0w8mGZbQRZyPBk.NYSmNPNmusBI8emu.g9Gr03k7oMFef8engvQPCDdvXo7X.3OhTBspWhQDF
 p2xfCxpSHmQ4Nj4F0Lvq6loHVHZ72zEXX3_dAIdkneuePACBLpU.uN1kEEEawEpq0VWbMpdzf1xI
 LobAaGC7DdWzg0kzJEJc2gNhsQOLfqZCxd_uQQxoFPDLjNnlL1l4E4Q.3nsyd6_TqysZhfrFrMcV
 w9VRV2STsOeY9UBek7xUTVjGja7zV0u0KX.z9.4W1pjo8Cbd7l48XhSeZy_IXjSTDNsWHV8VexH_
 N7854WlUgQUpP57eorBwGhyGa_0YlY0T_nfIjxikF6XZf9yns.WcX18PJudw4TY1OuhTe.6dXZk9
 WPjsBlC3K_M9Wc1Vgd0FGrV._13JDyKasDQVXubY_CIAhriHkpboAgeZcGhmOxe7ttFSmCqYuPXc
 YQkyd8GERmBV7lJ7CqZV0zSonymyZWcggnWO0nzt3s09ibxQ50rLRedbV7kgy37kPg4LBG61aG0q
 QDQtPoIdfAHJ5UprWRMf9nOuoQj04OXXAqtrkqIsEd5kHP0X59KkilOc4Z9D4VQqmA07P_R4wBw3
 h7WByNXjVaQWW9.RPrdhjro3YrPck77y0PqpuJsv2oYdY09At2UEQtd6lqur.d4gS156oUXdLj71
 LPkBks7p0jrd5mQ7vZxf0FKmQgOk5JcPg4bNqmpW3r98E78t5svIrXZG78epwSqmcsDSXYsCEXkb
 gF27v3bpYKyO7lSYU_B_nTazev9FByV.1
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Tue, 25 Oct 2022 00:40:07 +0000
Received: by hermes--production-gq1-754cb59848-rl7fd (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c725735263443336e82dbdb6410c70fe; 
 Tue, 25 Oct 2022 00:40:01 +0000 (UTC)
Message-ID: <e52efeda-9adf-4128-1906-3c83f217b99c@schaufler-ca.com>
Date: Mon, 24 Oct 2022 17:39:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v38 39/39] LSM: Create lsm_module_list system call
To: Kees Cook <keescook@chromium.org>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927203155.15060-1-casey@schaufler-ca.com>
 <202210121459.00980C2@keescook>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <202210121459.00980C2@keescook>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: john.johansen@canonical.com, paul@paul-moore.com, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 casey.schaufler@intel.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/12/2022 3:04 PM, Kees Cook wrote:
> On Tue, Sep 27, 2022 at 01:31:55PM -0700, Casey Schaufler wrote:
>> +SYSCALL_DEFINE3(lsm_module_list,
>> +	       unsigned int __user *, ids,
>> +	       size_t __user *, size,
>> +	       int, flags)
> Please make this unsigned int.

Sure.


>> +{
>> +	unsigned int *interum;
>> +	size_t total_size = lsm_id * sizeof(*interum);
>> +	size_t usize;
>> +	int rc;
>> +	int i;
> Please test that flags == 0 so it can be used in the future:
>
> 	if (flags)
> 		return -EINVAL;

Yup.

>> +
>> +	if (get_user(usize, size))
>> +		return -EFAULT;
>> +
>> +	if (usize < total_size) {
>> +		if (put_user(total_size, size) != 0)
>> +			return -EFAULT;
>> +		return -E2BIG;
>> +	}
>> +
>> +	interum = kzalloc(total_size, GFP_KERNEL);
>> +	if (interum == NULL)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < lsm_id; i++)
>> +		interum[i] = lsm_idlist[i]->id;
>> +
>> +	if (copy_to_user(ids, interum, total_size) != 0 ||
>> +	    put_user(total_size, size) != 0)
>> +		rc = -EFAULT;
> No need to repeat this, if it is written first.
>
>> +	else
>> +		rc = lsm_id;
>> +
>> +	kfree(interum);
>> +	return rc;
> No need for the alloc/free. Here's what I would imagine for the whole
> thing:

A better approach. Thank you.

>
> 	if (flags)
> 		return -EINVAL;
>
> 	if (get_user(usize, size))
> 		return -EFAULT;
>
> 	if (put_user(total_size, size) != 0)
> 		return -EFAULT;
>
> 	if (usize < total_size)
> 		return -E2BIG;
>
> 	for (i = 0; i < lsm_id; i++)
> 		if (put_user(lsm_idlist[i]->id, id++))
> 			return -EFAULT;
>
> 	return lsm_id;
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

